ARG TALOS_VERSION=v0.14.0
ARG TALOS_KERNEL_VERSION=v0.9.0

FROM scratch AS customization
COPY --from=ghcr.io/caprisys/kernel:${TALOS_KERNEL_VERSION}-${TARGETARCH} /lib/modules /lib/modules

FROM ghcr.io/talos-systems/installer:${TALOS_VERSION}
COPY --from=ghcr.io/caprisys/kernel:${TALOS_KERNEL_VERSION}-${TARGETARCH} /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
