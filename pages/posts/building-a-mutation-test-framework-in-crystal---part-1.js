import Full from "@/components/posts/full";
import Layout from "@/components/layout";

export const post = {
  slug: "building-a-mutation-test-framework-in-crystal---part-1",
  title: "Building a mutation test framework in crystal - Part 1",
  publishedAt: "2019-01-22 15:10:57+00",
  type: "long-form",
  summary: `In this series of posts I want to explain and document the basic building blocks of building a mutation test framework in [crystal-lang](https://crystal-lang.org). For a bit more context on the working framework named [crytic](https://github.com/hanneskaeufler/crytic), make sure to check out the [introductory post](http://hannes.kaeufler.net/posts/introducing-crytic---mutation-testing-in-crystal-lang).`,
  content: `In this series of posts I want to explain and document the basic building blocks of building a mutation test framework in [crystal-lang](https://crystal-lang.org). For a bit more context on the working framework named [crytic](https://github.com/hanneskaeufler/crytic), make sure to check out the [introductory post](http://hannes.kaeufler.net/posts/introducing-crytic---mutation-testing-in-crystal-lang).

So let's get into the first block:

### Mutating code
To start off, let's have a look at how we can modify some code programmatically. This is after all one of the cornerstones of mutation testing: mutating the code under test. As an example, let's assume we have the subjects code present in a string, and we want to change each occurrence of \`true\` to \`false\` instead.

We could go ahead and pull our trusty \`Regex\` trickery out of the bag and do a string replacement on the code. This could work in a simple example, but in more complex scenarios, this would be problematic. Think comments, or future mutant's that not only do simple boolean replacements.

Are more robust way of doing this is to get an alternate representation of the code, versus only having a string. A better representation is the [abstract syntax tree](https://en.wikipedia.org/wiki/Abstract_syntax_tree) (AST). The AST is a data structure used in compilers, such as the crystal compiler. We can obtain an AST from a string by using crystals own AST parser, like so:

\`\`\`crystal
require "compiler/crystal/syntax/*"

code = <<-CODE
def hello
  puts "hello"
end
CODE

ast = Crystal::Parser.parse(code)
\`\`\`

Now what? What good is the AST? Well, luckily, crystal also provides means of interacting with it. There are two types of classes in crystal to deal with the AST: \`Visitor\` and \`Transformer\`. Let's make a simplified distinction here. \`Visitor\` lives to _inspect_ the AST, and \`Transformer\` is the best choice to _modify_ the ast. So let's subclass \`Transformer\` and build ourselves a "mutant".

\`\`\`crystal
require "compiler/crystal/syntax/*"

code = <<-CODE
def hello
  true
end
CODE

ast = Crystal::Parser.parse(code)

class BooleanTransformer < Crystal::Transformer
  def transform(node : Crystal::BoolLiteral)
    Crystal::BoolLiteral.new(false)
  end
end

puts ast.transform(BooleanTransformer.new)
# => will print:
# def hello
#   false
# end
\`\`\`

That's it! The AST will apply our transformer, which will be called for every \`BoolLiteral\`, and return a literal \`false\`.

### Mutating only certain code
Let's go one step further and look at how we could decide whether to transform a certain piece of code, or not. Analysing the source code first can give us the benefit of knowing beforehand how many mutations we can perform, and possibly excluding certain nodes. Imagine multiple booleans inside the above \`def hello\`. Our current transformer would replace them all at the same time. Now for a mutation testing tool this is undesired, since we want to observe _one change at a time_. Implementing an aforementioned \`Visitor\` can give us a _location_ to every boolean:

\`\`\`crystal
class BooleanVisitor < Crystal::Visitor
  def visit(node : Crystal::BoolLiteral)
    puts "Line: #{node.location.try &.line_number}"
    puts "Column: #{node.location.try &.column_number}"
    true
  end

  def visit(node : Crystal::ASTNode)
    true
  end
end

ast.accept(BooleanVisitor.new)
# => will print:
# Line: 2
# Column: 3
\`\`\`

Now we can save that location, an instance of \`Crystal::Location\`, to the boolean or ignore it if we want.

Those two subclasses together, the \`Transformer\` and the \`Visitor\`  allow crytic to actually mutate code.

Next time we will probably look at how to actually run the mutated code.`,
};

export default function Post() {
  return (
    <Layout>
      <Full post={post} />
    </Layout>
  );
}
