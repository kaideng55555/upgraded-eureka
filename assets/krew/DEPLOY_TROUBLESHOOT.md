add/deploy-troubleshoot
# Krew / Deploy Troubleshooting

Purpose
- Document common deployment failure modes for krew assets and provide commands and checks to quickly diagnose and remediate issues.

Quick triage checklist
1. Confirm which environment is affected (local / staging / production).
2. Check recent commits and PRs merged to the release branch.
3. Inspect CI/CD pipeline logs for failed steps (build, test, publish).
4. Verify artifact presence (container images, krew index files, release archives).
5. Check CDN or hosting status (edge cache, signed URLs).

Common symptoms and immediate checks
- Failure to publish index or plugins:
  - Check CI logs for errors during krew packaging or cloud upload steps.
  - Confirm credentials/secrets in CI (GCS, S3, GitHub token) are valid and not expired.
- Consumers get 404 for plugin or index:
  - Confirm index files exist at the expected path in the bucket/repo.
  - Validate object permissions and public-read settings.
  - Check CDN edge status/propagation.
- Client fails on plugin install:
  - Ask for `kubectl krew version` output and `kubectl krew index list`.
  - Check plugin manifest for required fields (name, version, shortDescription).
- Broken checksums / corrupted archive:
  - Recompute SHA256 of plugin archive and compare to index manifest.
  - Re-upload artifact and update index if necessary.

Environment-specific checks
- Kubernetes / Krew client:
  - Commands to collect:
   <plugin>
  - Check for incompatible client versions.
- Docker / Build:
  - docker build logs
  - docker images | grep <name>
- Cloud provider (S3 / GCS):
  - aws s3 ls s3://<bucket>/path/
  - gsutil ls gs://<bucket>/path/
  - Confirm bucket region, ACLs, and object-level encryption settings.
- GitHub Releases / Artifacts:
  - Verify release exists and artifacts are attached.
  - Use the Releases UI or `gh release view <tag>`.

Commands to collect diagnostics
- List index files and sizes:
  - aws s3 ls s3://<bucket>/krew-index/ --recursive
  - gsutil ls -l gs://<bucket>/krew-index/**
- Download and validate a plugin manifest:
  - curl -fSL <index_raw_url>/plugins/<plugin>.yaml -o /tmp/plugin.yaml
  - sha256sum /tmp/<artifact>
- CI artifact inspection:
  - Download failure logs from CI run and search for keywords: "permission denied", "401", "404", "checksum".

Quick fixes
- Rebuild and re-upload plugin archive, then update index manifest.
- Revoke and re-create CI credentials (short-term mitigation: run the publish job locally with a developer’s creds).
- If CDN caching causes stale content, invalidate the affected paths or purge the edge cache.

Escalation steps
1. Gather diagnostics from above commands and attach logs.
2. Reproduce publish locally (with a test index) to isolate CI vs environment issues.
3. Open an incident with cloud provider support if the bucket or CDN is returning errors.
4. Roll back index changes and push a known-good index if client installs are widely failing.

Related links
- krew index format: https://github.com/kubernetes-sigs/krew-index
- krew client docs: https://krew.sigs.k8s.io/
add/deploy-troubleshoot → Propose new file → Create pull request.
main
