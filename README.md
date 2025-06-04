# Cloud Security for DevSecOps Engineers: From Security Models to API Protection

:construction: **This repository is still undergoing development.** :construction:

This is the repository for the LinkedIn Learning course `Cloud Security for DevSecOps Engineers: From Security Models to API Protection`. The full course is available from [LinkedIn Learning][lil-course-url].

![course-name-alt-text][lil-thumbnail-url]

This repository will contain the entire codebase and instructions for running Trivy scans within the CodeSpaces container. To get the most out of this repository, please ensure you take a look at the following videos for this course:

1. Using Codespaces
1. Scanning IaC for Misconfigurations
1. Demo - GitHub Actions IaC Scanning

## Setup and Configuration

Follow the steps below to properly set up your development environment and install the necessary tools.

### 1. Environment Preparation

- **Star this repository** on GitHub to bookmark it for future reference.
- **Download and install [Visual Studio Code](https://code.visualstudio.com/)**. This code editor is highly recommended for working with GitHub repositories and development containers.
- **Install the following Visual Studio Code extensions:**

  - **GitHub Workspaces** – enables integration with GitHub repositories and remote workspaces.
  - **Dev Containers** – provides support for development within containerized environments.

### 2. Fork and Open the Repository

- **Fork this repository** to your personal GitHub account. This creates a copy you can modify.
- **Open your forked repository** using the GitHub Workspaces extension within Visual Studio Code. This will launch a cloud-based development environment for your fork.

### 3. Install Trivy in the Workspace Terminal

Once your GitHub Workspace is running, open the terminal in Visual Studio Code and execute the following commands to install [Trivy](https://aquasecurity.github.io/trivy/), a vulnerability and misconfiguration scanner:

```bash
sudo -i
apt update
wget https://github.com/aquasecurity/trivy/releases/download/v0.57.1/trivy_0.57.1_Linux-64bit.deb
dpkg -i trivy_0.57.1_Linux-64bit.deb
exit
```

This will download and install version `0.57.1` of Trivy in your workspace.

### 4. Add the HTML Report Template

To output Trivy results in HTML format, download the HTML template provided by the Trivy project:

```bash
$ mkdir -p contrib
$ wget https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/html.tpl -O contrib/html.tpl
```

## Usage

After installation, you can begin scanning a configuration directory which contains the `main.tf` file by running the following command below:

```bash
$ trivy config --format template --template "@contrib/html.tpl" -o results.html 04_05/
```

The results will be written to results.html. You can open the file directly in your browser to review the findings, as shown below:

![Results](./docs/images/trivy_results.png)

## Instructor

[Damien Burks]
Cloud DevSecOps Engineer & Founder of DevSec Blueprint
Check out my other courses on [LinkedIn Learning](0)

<!-- README Links -->

[0]: # "Replace these placeholder URLs with actual course URLs"
[lil-course-url]: https://www.linkedin.com/learning/
[lil-thumbnail-url]: https://media.licdn.com/dms/image/v2/D4E0DAQG0eDHsyOSqTA/learning-public-crop_675_1200/B4EZVdqqdwHUAY-/0/1741033220778?e=2147483647&v=beta&t=FxUDo6FA8W8CiFROwqfZKL_mzQhYx9loYLfjN-LNjgA
[Damien Burks]: https://damienjburks.com/
