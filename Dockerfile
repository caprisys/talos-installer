ARG TALOS_VERSION=v0.14.0
ARG TALOS_KERNEL_VERSION=v0.9.0-4

FROM ghcr.io/caprisys/kernel:$TALOS_KERNEL_VERSION as kernel

FROM scratch AS customization
COPY --from=kernel /lib/modules /lib/modules

FROM ghcr.io/talos-systems/installer:$TALOS_VERSION
COPY --from=kernel /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
