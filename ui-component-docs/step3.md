# Step 3

Our Button component is complete, but if we want other developers to download and use this component ever, we should add some default values and warning messages for when an incorrect prop value is used.

> **Important:** Make sure you're in the correct branch, `step-3`. Use the terminal or VSCode window to switch between branches.

## Add Prop Types

If you navigate to the `Button/index.jsx` file, you'll notice that the PropTypes library has already been imported for us. Let's put it to use for our `Button` component.

Add the following code near the bottom of `Button/index.jsx`:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="insert" data-marker="#step-3_1">Button.propTypes = {
  children: PropTypes.node.isRequired,
  variant: PropTypes.oneOf(Object.values(VARIANTS)),
  disabled: PropTypes.bool,
  href: PropTypes.string,
};

Button.defaultProps = {
  variant: VARIANTS.PRIMARY,
  disabled: false,
  href: undefined,
};
</pre>

First, we set the `propTypes` property on our `Button` component to inform it what props it should always expect and what kind of data they should all be. If anything prop value doesn't match what we set here, the component will still render, but there will be a warning message thrown to the DevTools console.

Next, we set the `defaultProps` property. This allows users to call upon the Button component without having to pass certain props in and still receive an intended result.

Let's see how it all works!

## Add to App and Test

In `App.jsx`, let's add one more variations of our Button component. This time, though, we'll pass a `variant` value that doesn't exist in our predefined variant list. Add the following code:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-3_2">&#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
  &#x3C;Button variant=&#x22;tertiary&#x22;&#x3E;This button has an incorrect variant property&#x3C;/Button&#x3E;
&#x3C;/div&#x3E;
</pre>

Here we have a version of almost every type of Button rendering to the page. Run the following command to start the development server and open the `Main Site` tab:

`npm run dev`{{execute}}

Now we don't need to pass any variant props at all and still get a nice-looking button rendered to the page! Notice the one at the bottom with the incorrect `variant` prop value passed in? We could set that up to also render the primary button style, but having that visual cue may help a developer identify something's amiss and check the DevTools console, we're they'd find a message stating that they are using an incorrect prop value.

The work we did here adds a lot to a developer's experience if they are to use this component library in their own project. Not only can they do less work because of the default props set up, they can also debug any errors by checking for a mismatched prop value.

Let's take this a step further and actually create documentation for this component!

## Save Our Work

Before moving on, take a moment and save your work. Then checkout into the next step's branch to ensure a clean environment. Do so by running the following commands:

`git add -A
git commit -m 'feat(step-3): adds prop types'
git checkout step-4
`{{execute interrupt}}

In the next step, we'll use Storybook and write documentation for our new UI component using MDX.

