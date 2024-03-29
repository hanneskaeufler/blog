import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "local-variable",
  title: "Local variable",
  publishedAt: "2016-04-23T16:51:44",
  content: `This is the first installment of "A vs. B", the series on the details of (mostly unit) tests. Without going into much detail, having an extensive set of unit tests to verify the behaviour of the parts composing a computer program is of immense value. But since those tests are code as well, we should look at the quality of those tests with laser eyes as well.

This specific example is PHP code and assumes an xUnit style test, in this case using [PHPUnit](http://phpunit.de). The tools and even language however are completely besides the issue I want to focus on. So here are the two variants:

## A

\`\`\`php
<?php

public function test_it_sets_the_full_name() {
    $subject = new User();
    $name = "Peter";

    $subject->setFirstname($name);

    $this->assertEquals($name, $subject->getFirstname());
}
\`\`\`

## B

\`\`\`php
<?php

public function test_it_sets_the_full_name() {
    $subject = new User();

    $subject->setFirstname("Peter");

    $this->assertEquals("Peter", $subject->getFirstname());
}
\`\`\`

Example A uses the local variable *name* to both as a parameter to the method call on the [system under test](http://xunitpatterns.com/SUT.html) as well as to specify the expected value to the assertion. Example B in contrast does not use a local variable. It simply uses the string literal *"Peter"* twice. While there is some obvious duplication to the literal in variant B, I personally still tend to go this route. While I agree that you'd have to change two lines of code if you were to call *"Peter"* *"Mark"* instead, how often are you going to change the string?

Being able to recognize a dead clear assertion (firstname should equal "Peter") by looking only at a single line of code is very useful to me. This becomes increasingly helpful when you have to spot the line where a test failure is coming from.

There you go "A vs. B", round one. What do you think?`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}
