# Step 1

- Create button file

Let's start by creating a new file for our component. Run the following command:

`mkdir ./src/components/Button && touch ./src/components/Button/index.jsx`{{execute}}

Then open the file:

`./src/components/Button/index.jsx`{{open}}

- append imports

Now let's get our dependencies imported:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">
import React from 'react';
import styled, { css } from 'styled-components';
import { theme, typeScale, primaryFont } from '../../utils';

</pre>

- append initial button styles

Now let's set up our button:

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

- append button and export

Great! We have our base button all set up and created, but we still want to allow users to use this component as an anchor tag if they'd like, so let's add the following code and finish out the file (for now).

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">
const ButtonLink = StyledButton.withComponent('a');

export const Button = (props) => {
  return props.href ? (
    <ButtonLink href={props.href} {...props} />
  ) : (
    <StyledButton {...props} />
  );
};

export default Button;

</pre>


- insert into app.jsx

With this in place, we now allow users to call the `<Button>` component as either a `<button>` or an `<a>` depending on the existence of the `href` prop.

Let's see how it looks! Let's import it into our `App.jsx` file with the following import statement:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_1">import { Button } from './components/Button';

</pre>

Now let's include an example into our JSX with the following code:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_2">
  <div style={{ margin: '16px 0' }}>
    <Button>This is a button</Button>
  </div>
  
</pre>

Now let's test it out and see it in action! Run the following command and open the `Main Site` tab:

`npm run dev`{{execute}}

Great work! 