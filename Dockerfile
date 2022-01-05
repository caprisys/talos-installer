ARG TALOS_VERSION=v0.14.0
ARG TALOS_KERNEL_VERSION=v0.9.0-2-g988ed42

FROM scratch AS customization
COPY --from=ghcr.io/caprisys/kernel:${TALOS_KERNEL_VERSION} /lib/modules /lib/modules

FROM ghcr.io/talos-systems/installer:${TALOS_VERSION}
COPY --from=ghcr.io/caprisys/kernel:${TALOS_KERNEL_VERSION} /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
