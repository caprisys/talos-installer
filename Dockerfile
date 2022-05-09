ARG TALOS_VERSION=v1.0.4
ARG TALOS_KERNEL_VERSION=v0.10.0-alpha.0-52-gb222e48-dirty

FROM ghcr.io/caprisys/kernel:$TALOS_KERNEL_VERSION as kernel

FROM scratch AS customization
COPY --from=kernel /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:$TALOS_VERSION
COPY --from=kernel /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
