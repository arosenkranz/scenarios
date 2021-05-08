# Step 1

In this first step, we'll inherit a codebase and extend upon it by adding a new Button component.

While everything is installing and getting set up, get yourself acclimated with the environment. Select the **IDE** tab to load up the VSCode environment, as we'll be doing most of our work between there and the terminal!

## Build the Component

Once everything is installed, let's and create a new file for our component. Run the following commands to create a directory and file:

`mkdir ./src/components/Button && touch ./src/components/Button/index.jsx`{{execute}}

Then open the file in the IDE by selecting the next file path:

`./src/components/Button/index.jsx`{{open}}

Import the component's dependencies by copying the following code into the file:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">import React from 'react';
import styled, { css } from 'styled-components';
import { theme, typeScale, primaryFont } from '../../utils';

</pre>

We don't need to concern ourselves with the contents of our imports from the **utils** directory, but feel free to take a moment to explore those files before moving on if you want to see how the color theme and typographic properties are set up.

Now let's set up our Button component's default styles. Add the following code into `Button/index.jsx`:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">
const StyledButton = styled.button`
  border-radius: none;
  display: inline-block;
  min-width: 75px;
  cursor: pointer;
  font-family: ${primaryFont};
  text-decoration: none;
  transition: all 0.2s ease-in-out;
  padding: 12px 16px;
  font-size: ${typeScale.header5};

  &:hover {
    box-shadow: 0 5px 5px rgba(0, 0, 255, 0.25);
  }

  &:focus {
    outline: 2px solid ${theme.button.primary.bgHover};
    outline-offset: 2px;
  }

`;

</pre>

Here we use the tagged template function, `styled.button`, to define our `StyledButton` component and apply styles for it's default, hover, and focus states.

We have our default button all set up and created, but we still want to allow users to use this component as an anchor tag if they'd like, so let's add the following code and finish out the file (for now).

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">
const ButtonLink = StyledButton.withComponent('a');

export const Button = (props) => {
  return props.href ? (
    &#x3C;ButtonLink href={props.href} {...props} /&#x3E;
  ) : (
    &#x3C;StyledButton {...props} /&#x3E;
  );
};

export default Button;

</pre>

The `withComponent` function allows us to take style definitions from a component and copy it over to a different HTML element.

With this in place, we now allow users to call the `<Button>` component as either a `<button>` or an `<a>` depending on the existence of the `href` prop.

## Test Component in App

Let's see how our Button looks! Import it into the `App.jsx` file with the following import statement:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_1">import { Button } from './components/Button';
</pre>

Now let's include an example into our JSX with the following code:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_2">&#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button onClick={() =&#x3E; alert(&#x27;clicked!&#x27;)}&#x3E;This is a button&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
      &#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button href=&#x22;#&#x22;&#x3E;This is a link&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
</pre>

Notice how we pass an `onClick` event handler to the `<Button>`? Remember, when all is said and done, these are still valid React components returning. So we get to use all of the tools and features we're used to using with React!

If we pass an `href` to the component as a prop, the component will still render, except this time as an anchor element instead.

Now let's test it out and see it in action! Run the following command to start the development server and open the `Main Site` tab to see our Button on the page with the other components already created for us:

`npm run dev`{{execute}}

Great work! As we can see on the page, our new component is rendered along with some default styles and hover and focus states. The page should look something like the following image:

![The main page displays previously created components and the new Button components.](ui-component-docs/assets/01-1_default-btn.png)

## Save Our Work

Before moving on, take a moment and save your work. Then checkout into the next step's branch to ensure a clean environment. Do so by running the following commands:

`git add -A
git commit -m 'feat(step-1): adds button component'
git checkout step-2
`{{execute interrupt}}

In the next step, we'll take this component further and add variants to help distinguish different UI styles and states.

