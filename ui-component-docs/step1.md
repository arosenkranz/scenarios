# Step 1

In this first step, we'll inherit a codebase for a design system and extend upon it by adding a new Button component.

While everything is installing and getting set up, get yourself acclimated with the environment. Select the **IDE** tab to load up the VSCode environment, as we'll be doing most of our work between there and the terminal!

## Build the Component

Once everything is installed, click the code below to run following commands to create a directory and file for our component:

`mkdir ./src/components/Button && touch ./src/components/Button/index.jsx`{{execute}}

Then open the file in the IDE by clicking the next file path:

`./src/components/Button/index.jsx`{{open}}

Import the component's dependencies by copying the following code into the file:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">import React from 'react';
import styled, { css } from 'styled-components';
import { theme, typeScale, primaryFont } from '../../utils';

</pre>

Now let's set up our Button component's default styles. Add the following code into `Button/index.jsx`:

<pre class="file" data-filename="./src/components/Button/index.jsx" data-target="append">
export const Button = styled.button`
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

Here we use the tagged template function, `styled.button`, to define our `Button` component and apply styles for its default, hover, and focus states.

## Test Component in App

Let's see how our Button looks! First open the `./src/App.jsx`{{open}} file.

Import the Button component into the file with the following line:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_1">import { Button } from './components/Button';
</pre>

Now let's include an example into our JSX with the following code:

<pre class="file" data-filename="./src/App.jsx" data-target="insert" data-marker="#step-1_2">&#x3C;div style={{ margin: &#x27;16px 0&#x27; }}&#x3E;
        &#x3C;Button onClick={() =&#x3E; alert(&#x27;clicked!&#x27;)}&#x3E;This is a button&#x3C;/Button&#x3E;
      &#x3C;/div&#x3E;
</pre>

In this component, we pass an `onClick` event handler to our component, as we normally do with most buttons in React. 

Now let's test it out and see it in action! Run the following command to start the development server:

`npm run dev`{{execute}}

Now open the [**Main Site**](https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com) tab.

As we can see on the page, our new component has joined the components we've inherited and is rendered to the page in two formats. The page should look something like the following image:

![The main page displays previously created components and the new Button components.](ui-component-docs/assets/step-01_1.png)

> **Tip:** If you want to use this component as a hyperlink, do so with something like `<Button as='a' href="#">I'm a link!</Button>` and render it as an anchor element!

## Save Your Work

Before moving on, take a moment and save your work. Then checkout into the next step's branch to ensure a clean environment. Do so by running the following commands:

`git add -A
git commit -m 'feat(step-1): adds button component'
git checkout step-2
`{{execute interrupt}}

In the next step, we'll take this component further and add variants to help distinguish different UI styles and states.

Let's take a quick knowledge check:

>>Question: How would we create a styled `h1` element with styled-components? <<
(*)  styled.h1``
( )  styled(h1)``
( )  withComponent(h1)
( )  h1``
