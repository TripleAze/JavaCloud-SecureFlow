# Architecture Diagram

```mermaid
graph TD
    subgraph "Local / Developer"
        Dev[Developer]
        Repo[GitHub Repository]
    end

    subgraph "AWS VPC"
        subgraph "Public Subnet"
            Jenkins[Jenkins EC2 Instance]
            Tomcat[Tomcat EC2 Instance]
        end
    end

    Dev -->|Push Code| Repo
    Repo -->|Webhook Trigger| Jenkins
    Jenkins -->|Build WAR| Build[Maven Build]
    Jenkins -->|SSH/SCP| Tomcat
    Tomcat -->|Serve App| Web[Port 8080]

    style Jenkins fill:#f9f,stroke:#333,stroke-width:4px
    style Tomcat fill:#bbf,stroke:#333,stroke-width:4px
```

## Description
1.  **Developer** pushes code to the `master` branch of the GitHub repository.
2.  **GitHub** sends a webhook notification to **Jenkins**.
3.  **Jenkins** triggers a pipeline that:
    - Checks out the latest code.
    - Uses **Maven** to build a Java WAR artifact.
    - Uses **SSH/SCP** to deploy the artifact to the **Tomcat** server.
4.  **Tomcat** serves the application on port 8080.
