# Contributing to the lecture notes

Contributions are welcome to improve these lecture notes! Whether you want to fix typos, improve explanations, or suggest new content, your help is appreciated.

Please follow the steps below to contribute.

## How to Contribute

### Reporting Issues

If you find an issue with the lecture notes (such as a typo, unclear explanation, or missing information), please open a new issue in the GitHub repository. You can do this by:
1. Navigating to the [Issues page](https://github.com/EricWay1024/Homological-Algebra-Notes/issues).
2. Clicking "New issue."
3. Providing a clear description of the issue and, if possible, a suggested fix.

In your issue, please indicate which version of the notes you are viewing by stating the date on the first page and whether it is the black-and-white or colour version.

### Making a Pull Request

1. **Fork the repository**: Click the "Fork" button at the top right of this page to create your own copy of the repository.
   
2. **Clone your fork**: Clone your fork to your local machine using the following command:
   ```bash
   git clone https://github.com/[YourUserName]/Homological-Algebra-Notes.git
   cd Homological-Algebra-Notes
   ```
    where you need to replace `[YourUserName]` with your GitHub user name.
    Alternatively, if you use VS Code, you can open a new window, and then `Clone Git Repository`, provide the URL `https://github.com/[YourUserName]/Homological-Algebra-Notes.git`, select a local folder to put this repo, and then open the cloned repository.
3. **Make your changes**: Edit the Typst files (`main.typ`, etc.). Find the chapters in the `ha` folder.  Make sure your changes are clear and well-organised.
4. **Commit your changes**: After making the changes, commit them to your branch:
    ```bash

    git add .
    git commit -m "Fix typo in Section 2.1"
    ```
    Replace the commit message with a brief description of what has been changed.

    Alternatively, if you use VS Code, you can open the Source Control panel on the left, review your changes, and type in your commit message, and then click the Commit button.
5. **Push to your fork**: Push your changes to your forked repository:
    ```bash
    git push
    ```

    Alternatively, if you use VS Code, you can click the Sync button.
6. **Create a pull request**: Once your changes are pushed, navigate to the original repository and open a pull request (PR) from your fork. Describe the changes you made and why they are important.