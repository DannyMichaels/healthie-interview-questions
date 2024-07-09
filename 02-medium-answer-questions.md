# Medium Answer

## Describe these data types. What are their similarities and differences?

```We aren't looking for a perfect comparison matrix, just discuss what's interesting and useful about each type.
(this list uses terminology from ruby): Array, Enumerable, Hash, Object, Set, String
```

- **Array**: An array is a list of elements that are indexed by integers, an element can be any type and can be found by its index.
- **Enumerable**: Enumerable is a module that provides a set of methods that can be used on collections like arrays, hashes, and ranges. It provides a way to iterate over collections and perform operations on them. For example, you can use the `map` method to transform each element in an array, which is a method provided by the Enumerable module.
- **Hash**: A hash is a collection of key-value pairs where each key is unique. Hashes are unordered and can be accessed by their keys. They are useful for storing data that needs to be looked up quickly in constant time.
- **Object**: An object is an instance of a class that has properties and methods. for example, an `MusicArtist` object might have properties like `name`, `genre`, and `albums`, and a method like `play_music`
- **Set**: A set is an list of _unique_ elements. For example, you can use a set to store a list of unique strings or numbers to check if these were already visited
- **String**: A string is a combination of one or many characters, you can manipulate a string with methods such as `upcase`, `downcase`, `split`, and more.

## Describe these functions, and how some of them relate to one another (this list uses terminology from ruby): find_all, map, reduce, reject

-- **find_all**: `find_all` is an enumerable method that returns an array containing all elements matching the condition(s) in "callback" block. For example: [1, 2, 3, 4, 5].find_all { |num| num.even? } would return [2, 4]
-- **map**: `map` is an enumerable method that returns a new array with the results of running the "callback" block once for every element in the array. For example: ["a", "b", "c"].map { |char| char.upcase } would return ["A", "B", "C"]
-- **reduce**: `reduce` is an enumerable method that combines all elements of the array specified by the "callback" block. For example: [1, 2, 3, 4].reduce { |acc, cv| acc + cv } would return 10. You can also ignore the callback block and use a symbol like so: [1, 2, 3, 4].reduce(:+) would return 10
-- **reject** `reject` is an enumerable method that returns an array containing all elements \_not\* matching the condition(s) in the "callback" block. For example: ['cat', 'dog', 'bird'].reject { |animal| animal == 'dog' } would return ['cat', 'bird']

## Describe why React is useful, and any thoughts on pros or cons you might have.

React is useful because it breaks down writing UI code into smaller reusable/sharable components, it also has a way to pass data between components and manage the state of the application, it's easier than
doing it in vanilla JS and html because it uses JSX which is a syntax extension for JavaScript that looks like HTML and you can't make re-usable components in vanilla html/js. React also has life cycle methods to listen to events like when a component is mounted or updated or when a variable has changed, that is useful because in current day applications almost every component conditionally displays data and has to listen to changes, in javascript you would have to write your own life-cycle logic. Additionally, a react component re-renders when a state changes, in vanilla js you would have to manually trigger a re-render.

Pros:

- Reusable components
- JSX (nice way to combine html and js)
- Life cycle methods
- State management
- Unopinionated (you can choose your own libraries for routing, state management, you can choose to use hooks or classes, etc)
- Performance (react is fast when used correctly, it uses a virtual DOM to only update the parts of the page that have changed, instead of re-rendering the whole page)

Cons:

- React is a library, not a framework, so you have to choose your own libraries for routing, state management, etc.
- React is not SEO friendly out of the box, you have to use server-side rendering or static site generation to make it SEO friendly, or use a library like Next.js or Gatsby.js which have SEO tools.
- React can be difficult to learn for beginners, especially if you're not familiar with JavaScript or modern web development, or it can give you bad habits if you learn it wrong and/or learn it too early before understanding the basics of web development.
- You have to use a lot of libraries to get the same functionality as other frameworks like Angular or Vue, unless you're using Next.js or Gatsby.js which are frameworks built on top of React.
- Easy to follow bad practices (Prop drilling, too much business logic in components, no `black box`, etc), which can easily lead to a messy codebase and poor performance.
- Unopinionated (code can be messy if you don't follow best practices, which aren't enforced by the library).
- JSX (some people don't like it, my friend that is an angular fan says it looks like messy php code), I respectfully disagree with him, but it's a valid point since the JSX that he saw had too much business logic in it.

## If you wanted to improve the performance of a web app you were working on, what are some things you would look at / try?

it depends where the problem is, let's say the problem is in the front-end, I would look at the following:

- event listeners: are there too many event listeners? are they being removed when they're not needed?
- re-renders: are components re-rendering when they don't need to? are they re-rendering too often?
- state management: is the state being managed correctly? are there too many state changes?
- life cycle methods: are life cycle methods being used correctly? are there things in dependencies that are triggering too many calls to life cycle methods?
- network requests: are there too many network requests? are they being cached?
- images: are there too many images? are they being compressed? where are they coming from? are they lazy-loaded?
- prop-drilling: are there too many props being passed down?

if it's in the back-end, I would look at the following:

- database models: are the models written/used correctly? are there indexes on the right columns?
- queries: are the queries written correctly?
- caching: are there things that can be cached (like query results)? are they being cached?
- queues: check if some tasks can be done in the background, like sending emails, or processing images, etc.
- horizontal scaling: can the app be scaled horizontally? can we move some functions to a different server or an aws lambda function?
- dirty database: are there too many records in the database? are there records that are not being used? are there records that can be archived? do our records have heavy base64 images that can be moved to a CDN?
- image hosting: are we hosting images on the same server? can we move them to S3 or a CDN?
