import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "ftp-lives-deploying-a-static-site-with-bitbucket-pipelines",
  title: "FTP lives: Deploying a static site with Bitbucket pipelines",
  publishedAt: "2018-05-23 19:20:18+00",
  type: "long-form",
  content: `Yes. It still exists. Not the entire world has moved to a fancy pants containerized Kubernetes - Serverless - Cloud Hosting (I don't even know the actual latest trends) setup yet. Case in point is [pitbuddyapp.com](pitbuddyapp.com), website to my hobby [iOS](https://itunes.apple.com/us/app/pitbuddy/id871256006?mt=8&uo=4) and [Android](https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png) app for [rc car racing](https://www.youtube.com/watch?v=chladGajTmE) enthusiasts. The website is plain static html, no preprocessors, no javascript, build steps or the likes. It is hosted on my families [1und1](https://1und1.de) webspace. So how did I deploy this in the past? Yes, I took the trusty FTP program and copied the files (insert laughter here).

<!--more-->

## Bitbucket pipelines
The code for the site itself is versioned in a private repo on [bitbucket.org](https://bitbucket.org), and bitbucket does come with their version of CI/CD tooling called "pipelines". I wanted to use this since setting up yet another external CI integration like [travis](https://travisci.com) or [circleci](https://circleci) felt a bit overkill for this. Granted, the site did not have _any_ tests/verification at all so far.

### BackstopJS once more

Having no tests or verification mechanism at all is not a great prerequisite for a continuous delivery toolchain, even for a static site. This would mean broken versions of the site would be deployed without warning. So once more [backstopjs](https://github.com/garris/backstopJS) to the rescue. Setting up backstopjs was again without hassle, it can resolve \`file://\` urls no problem. So a set of reference images were quickly created and I could look at reproducing those images in the pipeline.

### The pipeline

Bitbucket pipelines are configured through a \`bitbucket-pipelines.yml\` file. No surprises here, thats in essence how most of the CI providers do it. The two cornerstones of the pipeline are two docker images. One to run the visual regression tests, the other to do the deployment. That's a "test->deploy" pipeline in a nutshell. This is the configuration in it's entirety:

\`\`\`yaml
pipelines:
  default:
    - step:
        name: "Run visual regression tests"
        image: backstopjs/backstopjs:v3.2.15
        script:
          - backstop test
    - step:
        name: "Deploy to website"
        image: fgch/alpine-gitftp
        deployment: production
        script:
          - git ftp push -u $FTP_USER -p $FTP_PASSWORD $FTP_URL
\`\`\`

 The test step, run directly on the official [backstopjs docker container](https://github.com/garris/BackstopJS/tree/master/docker), is simply executing the \`test\` task of backstopjs. This compares three  reference images (three because I set up three viewport sizes once more) against what is currently rendered when opening the \`index.html\`. When they are identical, the deploy pipeline step is triggered. Deploy is, as mentioned, as simple as copying the relevant files to the correct directory on the webspace. Already a while ago I found a git plugin to accomplish this. It is called [git-ftp](https://github.com/git-ftp/git-ftp) and solves my issue very smoothly. As for backstop, a docker image already exists just to run \`git ftp\`. So all I needed to do (and I have struggled to get this working in the past) was to create a separate ftp user (for security reasons), add the \`FTP_USER\`, \`FTP_PASSWORD\` and \`FTP_URL\` environment variables to the bitbucket pipelines settings and voilá, continuous deployment for a static site with the safety net of visual regression tests it is 🎉.
 \`git ftp\` can use a separate [ignore file](https://github.com/git-ftp/git-ftp/blob/master/man/git-ftp.1.md#ignoring-files-to-be-synced) to tune what content to deploy or omit.

### Lessons learned
 *
 * There is a docker container for almost anything
 * Does this approach scale? Probably not. Do I care? No.
 * I need to run backstopjs using the docker container locally as well, since there are text rendering (aliasing) differences on macOs vs. dockerized ubuntu.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}
