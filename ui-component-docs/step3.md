# Step 3

Our Button component is complete, but if we want other developers to download and use this component, we should add some default values and warning messages for when an incorrect prop value is used.

> **Important:** Make sure you're in the correct branch, `step-3`. Use the terminal or VSCode window to switch between branches.

## Add PropTypes

If you navigate to the `./src/components/Button/index.jsx`{{open}} file, you'll notice that the PropTypes library has already been imported for us. Let's put it to use for our Button component.

Add the following code near the bottom of the file:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="insert" data-marker="#step-3_1">Button.propTypes = {
  children: PropTypes.node.isRequired,
  variant: PropTypes.oneOf(Object.values(VARIANTS)),
  href: PropTypes.string,
};

Button.defaultProps = {
  variant: VARIANTS.PRIMARY,
  href: undefined,
};
</pre>

First, we set the `propTypes` property on our `Button` component to inform it what props are required and what type of data is expected. If any prop value doesn't match what we set here, the component will still render, but may look incorrect. There will also be a warning message thrown to the browser's developer console.

Next, we set the `defaultProps` property. This allows developers to call upon the Button component without having to pass certain props in and still receive an intended result.

Let's see how it all works!

## Add to App and Test

In `./src/App.jsx`{{open}}, let's add one more variation of our Button component. This time, though, we'll pass a `variant` prop value that doesn't exist in our predefined `BTN_VARIANTS` list. Add the following code:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-3_2">&#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
  &#x3C;Button variant=&#x22;tertiary&#x22;&#x3E;This button has an incorrect variant property&#x3C;/Button&#x3E;
&#x3C;/div&#x3E;
</pre>

Now we have a version of almost every type of Button rendering to the page. Run the following command to start the development server and open the [**Main Site**](https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com) tab:

`npm run dev`{{execute}}

Now we don't need to pass any `variant` props at all and still get a nice-looking button rendered to the page, as the next image shows:

![]()

Notice the one at the bottom with the incorrect `variant` prop value passed in? It doesn't break the application, but it does throw a warning to the developer console, as can be seen in the following image:

![]()

The work we did here adds a lot to a developer's experience if they are to use this component library in their own project. Not only can they do less work because of the default props set up, they can also debug any errors by checking for a mismatched prop value.

Let's take this a step further and actually create documentation for this component!

## Save Your Work

Before moving on, take a moment and save your work. Then checkout into the next step's branch to ensure a clean environment. Do so by running the following commands:

`git add -A
git commit -m 'feat(step-3): adds proptypes'
git checkout step-4
`{{execute interrupt}}

In the next step, we'll use Storybook and write documentation for our new UI component using MDX.

