# Step 2

Great work getting the Button component set up and tested. In this step, we're going to extend upon this component by accepting props that will dictate the style the button appears in.

> **Important:** Make sure you're in the correct branch, `step-2`. Use the terminal or VSCode window to switch between branches.

## Add Primary and Secondary Variants

Let's begin by defining what types of variants we'll have. This will help if we ever need to scale this component up and allow even more variants in the future. Add the following code below the import statements in `Button/index.jsx`:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="insert" data-marker="#step-2_1">const VARIANTS = {
  PRIMARY: &#x27;primary&#x27;,
  SECONDARY: &#x27;secondary&#x27;,
};
</pre>

With these in place, we'll be able to use them to check against inserted prop values and help determine which variant's styles should be rendered.

An interesting thing about styled-components is that we can check on the value of a prop from within our component's definition using JavaScript. Let's see how that works, add the following code into the `StyledButton` definition right under the defined styles:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="insert" data-marker="#step-2_2">${({ variant }) =&#x3E; {
    if (variant === VARIANTS.PRIMARY) {
      return css&#x60;
        background-color: ${theme.button.primary.bg};
        border: 1px solid ${theme.button.primary.bg};
        color: ${theme.button.primary.text};
        &#x26;:hover {
          background-color: ${theme.button.primary.bgHover};
          color: ${theme.button.primary.textHover};
        }
      &#x60;;
    } else if (variant === VARIANTS.SECONDARY) {
      return css&#x60;
        background-color: ${theme.button.secondary.bg};
        color: ${theme.button.secondary.text};
        border: 2px solid ${theme.button.secondary.border};
        &#x26;:hover {
          background-color: ${theme.button.secondary.bgHover};
          color: ${theme.button.secondary.textHover};
        }
      &#x60;;
    }
  }}
</pre>

Here, we execute a function that passes the `props` object in as a parameter. Since we're only interested in checking the value of the `variant` prop, we destructure the value out of the `props` object and check it's value against our `VARIANTS` object.

While we're here, let's also add style definitions for if the Button should be in a disabled state. This is important for both the user experience and accessibility, so it's good to make sure there's something in place.

## Add Disabled Button Styles

Right below our code for the variant styles in `StyledButton`, add the following:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="insert" data-marker="#step-2_3">${({ disabled }) =&#x3E;
    disabled &#x26;&#x26;
    css&#x60;
      background: none !important;
      color: ${theme.button.disabled.text} !important;
      border: 1px solid ${theme.button.disabled.text} !important;
      cursor: not-allowed;
      &#x26;:hover {
        box-shadow: none !important;
      }
    &#x60;}
</pre>

With this, we check if `props.disabled` exists and if it does, we render styles that let the user know that the button is unable to be selected.

Let's see how these different variations look!

## Add to App and Test

In `App.jsx`, we already have the Button component imported, so let's see how these variations look by adding the following code to the returning JSX:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-2_4">&#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button variant=&#x27;primary&#x27;&#x3E;This is a primary button&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
      &#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button variant=&#x27;secondary&#x27;&#x3E;This is a secondary button&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
      &#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button disabled&#x3E;This is a disabled button&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
      &#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button variant=&#x27;primary&#x27; href=&#x27;#&#x27;&#x3E;
          This is a primary button link
        &#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
      &#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button&#x3E;This button has no props&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
</pre>

Here, we provide a number of variations of the Button component so we can see how it looks.

Now let's test it out! Run the following command to start the development server and open the `Main Site` tab:

`npm run dev`{{execute}}

Awesome! Our Button component now renders in different styles based on passed in prop data. We should maybe do something about what happens if you pass in an incorrect prop, or no props at all, as that last button doesn't look too great compared to the others.

## Save Our Work

Before moving on, take a moment and save your work. Then checkout into the next step's branch to ensure a clean environment. Do so by running the following commands:

`git add -A
git commit -m 'feat(step-2): adds button component variants'
git checkout step-3
`{{execute interrupt}}

In the next step, we'll use the Prop Types library to set expected prop data and provide default prop values for our component and support the developer's experience using the component.

