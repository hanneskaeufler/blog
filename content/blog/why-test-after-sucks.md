+++
draft = false
title = "Why test after sucks"
date = "2016-12-20T19:17:17+01:00"

+++

"Test after" doesn't work. The longer I work in the software industry, the more
I tend to resent projects where testing is only applied to the code base after the fact.
In contrast to "test first", where you let the tests drive, it is my observation that you will surely get into
trouble and not arrive at either a great implementation, nor a great test suite. This is unfortunate.

Most of the issues can be attributed to the following, I think: "test after" does not promote doing the smallest and simplest
thing that works, neither does it promote refactoring. The following issues I have with the tests below are pretty well known:

## Useless error messages

The scenario is pretty easy. A developer implemented some code, remembers to write a test for it,
but probably only runs it once or maybe twice, stopping as soon as it is green. And believe me, I 
have seen tests without assertions before as well. Consider this test:

```java
@Test
public void testSplitTheListInHalf() {
    List list = new ArrayList();
    list.add("test a");
    list.add("test b");
    list.add("test c");
    list.add("test d");

    List splitList = split(list);

    assertEquals(splitList.size(), 2);
}
```

Obviously this example is contrived, but lets see an error we would get, if this
test failed.

```shell
Expected 4, was 2
```

Wait, what? If I saw this message, I would be seriously confused. Now granted, in this
case it's not too hard to figure out the expected and actual values are switched in
`assertEquals`. *This would not as easily happen doing tdd.* This only happens because the
developer likely never saw the test actualy fail.

## Useless details in tests

Copy & paste is the greatest thing ever. Is is also the devil at times. Look at
this test of an `update` method, for example a repository in a data-mapper implementation.

```java
@Test
public void testUpdateResetsTheDirtyFlag() {
    Book book = new Book();
    book.setTitle("Working with legacy code");
    book.setISBN("4234u23i42-423432423");
    book.setPrice(23.23);

    systemUnderTest.update(book);

    assertFalse(book.isDirty());
}
```

This test should only need three lines. However, the developer decided to implement
the functionality, the copy some other test, ran it, it was green, done. No. No. No.
Start by writing the simplest test possible, this is all it should take:

```java
@Test
public void testUpdateResetsTheDirtyFlag() {
    Book book = new Book();

    systemUnderTest.update(book);

    assertFalse(book.isDirty());
}
```

## Hacky tests

You have your dynamite implementaion working. Ah shit. Your manager told you to write
tests as well. Better get to it ... ! Ah well you `new`-up an instance of some collaborator
in there, screw it. Good thing we're in ruby, so lets just stub that.

```ruby
class Converter
    def convert_to_json(entity)
        JsonConverterThing.new.run(entity)
    end
end

def test_it_converts_entity_to_json()
    entity = Book.new(1)
    sut = Converter.new

    allow_any_instance_of(JsonConverterThing)
        .to receive(:convert)
        .and_return("{\"id\": 1}")

    result = sut.convert_to_json(entity)

    expect(result).to eql("{\"id\": 1}")
end
```

This is hacky. This is probably also more of a smell to me than to many others. You should consider mocking less, so
lets rather do this for example:

```ruby
class Converter
    def initialize(json_thing)
        @json_thing = json_thing
    end

    def convert_to_json(entity)
        @json_thing.new.run(entity)
    end
end

class FakeJsonConverter
    def convert
        "{\"id\": 1}"
    end
end

def test_it_converts_entity_to_json()
    entity = Book.new(1)
    sut = Converter.new(json_thing)

    result = sut.convert_to_json(entity)

    expect(result).to eql("{\"id\": 1}")
end
```

Sure, you might as well create a test double for the `JsonConverter` in rspec,
but this would still be better than the hacky test that just worked around the issues
in the implementation. Again, you would have at least have to think about this when
writing the test first, implementation second.

## Inability/problems to get some types of tests to run

Unit testing is great. It is also not the solution to all of your problems. Some
components are better tested in an integration test, some might even need to be tested 
end-to-end. The longer you wait to work on these tests, the more you will suffer. Your application
grows day by day, in code, in dependencies, in bugs, the list goes on.

Have you ever had to integrate, say, `arquillian` testing into a huge multi module java enterprise application?
It is a pain! You will have a much easier time doing this straight ahead, while building the architecture and
structure of your project alongside.

## Slow tests

Doing tdd you will grow impatient very quickly when your tests are running slow. Because you
are running them all the time, this adds up very quickly. You need them for feedback. If you do
test-after, this doesnt bother you as much, you will barely run the tests, maybe once before checkin
to make sure you got it right. However, you loose so many of the benefit a test suite can have.

## Bad production code

"Bad" is surely a matter of taste and agreed upon standards of your code-base. But there are things
turning me mad, that so very clearly show a lack of "refactoring" in red-green-refactor. Implement something,
test manually: "Well it works, I'm done". Then write any of the bad tests from above. Cool, goal achieved.
No, you missed cashing in on your tests! Let's refactor the hell out of our crappy first implementation,
having the safety net (tests) in full effect. Whenever I see stuff like:

```java
if (myBoolean)
    return true;
else
    return false;
```

I wonder if there are people on earth preferring this to

```java
return myBoolean;
```

Are there? Please tell me how wrong I am! Or is this a lack of attention to detail? Or a sign of fear of changing your code
after you made it work?


