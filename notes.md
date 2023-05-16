# Building pretty fast websites

## Intro 💻

- Websites. Fast or slow. Pretty or.. not. We all use them.
- But how many of you know what goes into building one?
- I'm going to give you an overview of what we in the WebDev team use to build websites, how we deploy then and how we make sure they're fast!

## What is a website made up of?

- each website is made up of:
  1. HTML, CSS, Javascript code. This is what the devs write 🤓
  2. Assets like images and videos. This is what the design team creates 🎨
  3. Content like blog posts, FAQs, and page copy. This is what the content team writes 📝
- take one of these away and you don't have a website anymore
- each one of these has to be optimised for the type website we're building

## The stack 📚

- we've arrived at a pretty good stack for building websites:
  - Next.js for the code
  - Sanity for the content
  - Vercel for hosting
- Next.js is a "framework". It provides a lot of out-of-the-box functionality that we don't have to write ourselves
- It's built by the same people as Vercel, so it's a match made in heaven
- Vercel hosts our websites. It's got servers all over the world (more on that later). When you load a website (e.g. Lace.io) the request is handled by one of Vercel's servers.
- Sanity is a CMS. We've landed on this because it's easy to set up, flexible and it's provides a studio for the content team to use.

## Perfomance considerations 🧑‍🔬

### Code size

- when a request is made to a website, we have to send to the browser not just the content, but also the code that makes it look pretty and the code that makes it interactive
- the less code we send, the faster the website loads
- we use techniques like minification, tree shaking, code splitting and lazy loading to reduce the amount of code we send to the browser
- we use tools to measure the size of the code we send to the browser, like Lighthouse and WebPageTest and bundlephobia.com (thanks @Brendan)

### Optimised assets

- images are big so in order to speed the websites that we build we use techniques like lazy loading, responsive images, and image compression

### Optimised content

- we've got different options to store content
- the simplest and fastest is files directly on the webserver
  - when a request comes in, the files can be served directly
  - but this is not very flexible
  - to update the content, we have to update the files on the server
- the next best option is a database
  - when a request comes in, the database is queried and the content is returned
  - this is more flexible, but it's slower
- for ultimate flexbility we use a CMS
  - when a request comes in, the CMS is queried and the content is returned
  - this is the slowest option, but it's the most flexible
  - CMS come with interfaces to make it easy for the content team to update the content
- our choice of framework allows us to use a technique to make content in a CMS as fast as files
  - we query the CMS and build the page once.
  - we save this output as a file on the webserver
  - if a request comes in for this page, we serve the file directly. We don't have to talk to the CMS
  - but what if the content changes? We can set up a webhook to tell us when the content changes. We can then rebuild the page and update it on the webserver
  - this is called "static site generation" and it's what we use for most of our websites
  - the drawback is it only works for content that doesn't change very often
    - we can't use it for authenticated pages.
