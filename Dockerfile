ARG TALOS_VERSION=v1.1.2
ARG TALOS_KERNEL_VERSION=v1.1.0-19-g6e906db@sha256:c430ab7c6e1cbca75fd95c238ded58e5ded5a0615cbe043b1d3ee8b10b837e5d

FROM ghcr.io/caprisys/kernel:$TALOS_KERNEL_VERSION as kernel

FROM scratch AS customization

FROM ghcr.io/siderolabs/installer:$TALOS_VERSION
COPY --from=kernel /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
COPY --from=kernel /lib/modules /lib/modules
