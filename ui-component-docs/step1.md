# Step 1

While everything is installing and getting set up, get yourself acclimated with the environment. Select the `IDE` tab to load up the VSCode environment, as we'll be doing most of our work between there and the terminal!

Once everything is installed, let's start by creating a new file for our component. Run the following commands to create a directory and file:

`mkdir ./src/components/Button && touch ./src/components/Button/index.jsx`{{execute}}

Then open the file in the IDE by selecting the next file path:

`./src/components/Button/index.jsx`{{open}}

In this file, let's first import our dependencies. Select this code to place it into the file:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">
import React from 'react';
import styled, { css } from 'styled-components';
import { theme, typeScale, primaryFont } from '../../utils';

</pre>

We don't need to concern ourselves with the contents of our imports from the `utils` directory, but feel free to take a moment to explore those files before moving on if you want to see how the color theme and typographic properties are set up.

Now let's set up our button's default styles. Add the following code into `Button/index.jsx`:

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

With this in place, we now allow users to call the `<Button>` component as either a `<button>` or an `<a>` depending on the existence of the `href` prop.

Let's see how it looks! Let's import it into our `App.jsx` file with the following import statement:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_1">import { Button } from './components/Button';
</pre>

Now let's include an example into our JSX with the following code:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_2">&#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
  &#x3C;Button onClick={() =&#x3E; alert(&#x27;clicked!&#x27;)&#x3E;This is a button&#x3C;/Button&#x3E;
&#x3C;/div&#x3E;
</pre>

Notice how we pass an `onClick` event handler to the `<Button>` component? Remember, when all is said and done, this is still valid React JSX returning. So we get to use all of the tools and features we're used to using with React!

Now let's test it out and see it in action! Run the following command to start the development server and open the `Main Site` tab to see our Button on the page with the other components already created for us:

`npm run dev`{{execute}}

Great work! Now let's save our work and checkout into the next branch before moving on. Run the following command:

`git add -A
git commit -m 'feat(step-1): adds button component'
git checkout step-2
`{{execute interrupt}}

In the next step, we'll take this component further and add variants to help distinguish different UI styles and states.

