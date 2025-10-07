# Cloud Security for DevSecOps Engineers: From Security Models to API Protection

This is the repository for the LinkedIn Learning course `Cloud Security for DevSecOps Engineers: From Security Models to API Protection`. The full course is available from [LinkedIn Learning][lil-course-url].

![course-name-alt-text][lil-thumbnail-url]

This repository will contain the entire codebase and instructions for running Trivy scans within the CodeSpaces container.

## Course Description

<p>Designed for new and early-career DevSecOps engineers, this course introduces cloud security through a DevSecOps lens. Get started by learning the fundamentals of cloud computing, service models, and the shared responsibility model. Explore the importance of key security services and control types, such as identity and access management (IAM), encryption, logging, and network segmentation, as well as API security fundamentals in cloud-native environments. Along the way, instructor Damien Burks dives into the essentials of infrastructure as code (IaC), showing you how to identify common risks, enforce compliance with policy as code, and automate security checks at scale using tools like Trivy. By the end of this course, you’ll be prepared to effectively apply key DevSecOps principles and concepts within the cloud security space.</p><p>This course is integrated with GitHub Codespaces, an instant cloud development environment that offers all the functionality of your favorite IDE without the need for any local machine setup. With GitHub Codespaces, you can get hands-on practice from any machine, at any time—all while using a tool that you’ll likely encounter in the workplace. Check out the “Using GitHub Codespaces with this course” video to learn how to get started.</p>

## Setup and Configuration

After logging into your environment within GitHub Codespaces, you'll want to ensure that you follow the commands in the sections below.

### 1. Install Trivy in the Workspace Terminal

Once your GitHub Workspace is running, open the terminal in Visual Studio Code and execute the following commands to install [Trivy](https://aquasecurity.github.io/trivy/), a vulnerability and misconfiguration scanner:

```bash
sudo -i
wget https://github.com/aquasecurity/trivy/releases/download/v0.64.1/trivy_0.64.1_Linux-64bit.deb
dpkg -i trivy_0.64.1_Linux-64bit.deb
exit
```

This will download and install version `0.64.1` of Trivy in your workspace.

### 2. Add the HTML Report Template

To output Trivy results in HTML format, download the HTML template provided by the Trivy project:

```bash
$ mkdir -p contrib
$ wget https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/html.tpl -O contrib/html.tpl
```

## Usage

After installation, you can begin scanning a configuration directory which contains the `main.tf` file by running the following command below:

```bash
trivy config --format template --template @contrib/html.tpl -o results.html 04_06/
```

The results will be written to results.html. You can open the file directly in your browser to review the findings, as shown below:

![Results](./docs/images/trivy_results.png)

## Instructor Information

[Damien Burks]

Cloud DevSecOps Engineer & Founder of The DevSec Blueprint

Check out my other courses on [LinkedIn Learning](0)

<!-- README Links -->

[0]: # "Replace these placeholder URLs with actual course URLs"
[lil-course-url]: https://www.linkedin.com/learning/cloud-security-for-devsecops-engineers-from-security-models-to-api-protection
[lil-thumbnail-url]: https://media.licdn.com/dms/image/v2/D4E0DAQHQo03dJr-HOw/learning-public-crop_675_1200/B4EZmhfhRnHgAc-/0/1759351018912?e=2147483647&v=beta&t=TudLGEWO4r0WQ_N4untrst_DyLy7IwswBMt66XJjL5Q
[Damien Burks]: https://www.linkedin.com/in/damienjburks/
