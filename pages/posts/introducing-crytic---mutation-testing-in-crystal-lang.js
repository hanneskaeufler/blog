import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "introducing-crytic---mutation-testing-in-crystal-lang",
  title: "Introducing crytic - mutation testing in crystal-lang",
  publishedAt: "2018-10-20 16:08:58+00",
  type: "long-form",
  summary: `While trying to be [as pedantic as possible](https://github.com/hanneskaeufler/blog#development) about test automation with this very [blog's source code](https://github.com/hanneskaeufler/blog), I had two todos: performance and mutation testing. Both of those I did not have a plan yet as to how to tackle them. However, I have previously dabbled in mutation testing with ruby's [mutant gem](https://github.com/mbj/mutant), so I at least had an idea of what to get out of a mutation test suite. Some searching revealed to me that there was no mutation test library yet for [crystal](https://crystal-lang.org). And what does the software engineer do in that case? Write his/her own of course! So I hereby present to you:

### Crytic`,
  content: `While trying to be [as pedantic as possible](https://github.com/hanneskaeufler/blog#development) about test automation with this very [blog's source code](https://github.com/hanneskaeufler/blog), I had two todos: performance and mutation testing. Both of those I did not have a plan yet as to how to tackle them. However, I have previously dabbled in mutation testing with ruby's [mutant gem](https://github.com/mbj/mutant), so I at least had an idea of what to get out of a mutation test suite. Some searching revealed to me that there was no mutation test library yet for [crystal](https://crystal-lang.org). And what does the software engineer do in that case? Write his/her own of course! So I hereby present to you:

### Crytic
[crytic](https://github.com/hanneskaeufler/crytic), distributed as a crystal shard, is my stab at mutation testing. It's new, it can't do much, it's probably buggy, but it already serves a simple purpose: Check parts of this blog's code for uncovered bits.

### About code coverage
You might say: "why the heck do I need this? I have a code coverage report that shows 100%, so I am golden!". However, take the following code as an example:

\`\`\`crystal
# valid.cr
def valid?
  true
end

# valid_spec.cr
require "./valid"
require "spec"

describe "valid?" do
  it "works" do
    valid?.should be_a(Bool)
  end
end
\`\`\`

This test will mark the \`valid?\` function as being 100% covered. But it does not at all make sure it works correctly. Returning \`false\` instead of \`true\` would still pass the test-suite at 100% coverage, but is obviously the opposite result.

So how to protect against this? Use crytic!

### Usage

Running \`crytic --subject valid.cr valid_spec.cr\` yields the following output:

\`\`\`
Original suite: ✅
Mutations covered by tests:

    ❌ BoolLiteralFlip (x1)
        The following change didn't fail the test-suite:
            @@ -1,3 +1,3 @@
             def valid?
            -  true
            +  false
             end
\`\`\`

The line \`Original suite: ✅\` is there to tell you that the original spec passed. This is helpful, because there is no point running mutated source code against a failing initial test-suite, because there is nothing to be learned from trying to make fail already failing tests.

\`❌ BoolLiteralFlip (x1)\` tells you that crytic has run one "mutation", more specificly the \`BoolLiteralFlip\` mutation on the \`valid?\` method. It changed the source code of the \`valid?\` method so that the boolean literal is \`false\` instead of \`true\`. It then ran the tests again. This mutation _did not_ make the test-suite fail, so a wrong implementation slipped through the cracks of the suite. What follows is the diff that was made in order to detect this.

### What to do with the result?

Improve the tests! So let's go ahead and run crytic on the improved test here:

\`\`\`
# valid.cr
def valid?
  true
end

# valid_spec.cr
require "./valid"
require "spec"

describe "valid?" do
  it "works" do
    valid?.should eq true
  end
end
\`\`\`

This will now show you \`✅ BoolLiteralFlip (x1)\` to tell you that indeed the test-suite detected the intentionally modified code. You can now be much more confident in your code coverage and refactoring your code.

### Future

Obviously crytic is still very much new and just an MVP. I plan to improve all parts (output, speed, more mutations, ...) of it and use it in a few more places. Feel free to try it out to improve your testing efforts. The world needs better (and less 🤪) software and test automation is key to achieving it.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}
