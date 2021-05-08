# Step 4

In this final step, we're going to add documentation for the Button component we just created, allowing developers to identify how to properly use it.

Storybook is the tool we'll be using for the documentation, as it specializes in documenting these types of libraries.

> **Important:** Make sure you're in the correct branch, `step-4`. Use the terminal or VSCode window to switch between branches.

## Set Up Documentation

First thing we need to do is create a file to hold our documentation for Storybook. Run the following command to create the file:

`touch ./src/components/Button/Button.stories.mdx`{{execute}}

If you're unfamiliar with MDX, that's okay. All we need to know is it allows us to combine the text formatting of Markdown and functionality of a React component using JSX! Open the file in the IDE by selecting the next file path:

`./src/components/Button/Button.stories.mdx`{{open}}

In this file, let's import our dependencies. Select this code to place it into the file:

<pre class="file" data-filename="./src/components/Button/Button.stories.mdx" data-target="append">import {
  Meta,
  Story,
  ArgsTable,
  Preview,
} from &#x27;@storybook/addon-docs/blocks&#x27;;

import { Button } from &#x27;./index&#x27;;

</pre>

Then let's set up some information about the page so Storybook knows what it's all about. Add the following code:

<pre class="file" data-filename="./src/components/Button/Button.stories.mdx" data-target="append">&#x3C;Meta title=&#x27;Design System/Button&#x27; component={Button} /&#x3E;

# Button

The button component can be used by importing it into your app with the following code:

&#x60;&#x60;&#x60;js
import { Button } from &#x27;@org/component-library&#x27;;
&#x60;&#x60;&#x60;
</pre>

Here, we use the Storybook `Meta` component to define the title of this page in the documentation and provide context as to what component we're documenting.

We then begin our documentation by explaining to the user what this component is and how to import it.

## Create Stories

Each defined use of a component in Storybook is known as a "Story". Using stories helps demonstrate how the component can be used with certain props.

Add the following Story definitions to the file with this code:

<pre class="file" data-filename="./src/components/Button/Button.stories.mdx" data-target="append">## Render a primary button

You can use a button for both DOM event binding or as a hyperlink &#x26;lt;a&#x26;gt;

&#x3C;Preview withToolbar&#x3E;
  &#x3C;Story name=&#x27;Primary&#x27;&#x3E;
    &#x3C;Button
      size=&#x27;default&#x27;
      variant=&#x27;primary&#x27;
      onClick={() =&#x3E; alert(&#x27;this button was clicked&#x27;)}
    &#x3E;
      This is a primary button with a click event
    &#x3C;/Button&#x3E;
  &#x3C;/Story&#x3E;
&#x3C;/Preview&#x3E;

## Render a secondary button

The secondary button will be used is forms.

&#x3C;Preview withToolbar&#x3E;
  &#x3C;Story name=&#x27;Secondary&#x27;&#x3E;
    &#x3C;Button size=&#x27;default&#x27; variant=&#x27;secondary&#x27;&#x3E;
      This is a secondary button
    &#x3C;/Button&#x3E;
  &#x3C;/Story&#x3E;
&#x3C;/Preview&#x3E;
</pre>

These will show users how to render a Primary and Secondary button and what they actually look like on a page.

## Add Args Table

Finally, we want to be able to show developers a table of all options for the component's prop values. Add the following code:

<pre class="file" data-filename="./src/components/Button/Button.stories.mdx" data-target="append">## Button Component Props

&#x3C;ArgsTable of={Button} /&#x3E;
</pre>

Great! Now let's see how it all looks.

Because this is running through Storybook, we are going to run this different command instead:

`npm run storybook`{{execute}}

Navigate to the documentation by selecting the **Documentation** tab in the dashboard. The resulting page should list all of the defined components, including our Button, as the following image shows:

![]()

Explore a little bit and get familiar with Storybook. Use the "Docs" tab to see all of the documentation we've written at once, including the table of possible prop argument values.

Great work on getting this component created and documented! Let's recap everything we learned on the following page.

