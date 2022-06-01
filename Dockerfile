ARG TALOS_VERSION=v1.0.5
ARG TALOS_KERNEL_VERSION=v0.10.0-alpha.0-62-g61ddf4e-dirty@sha256:e2982616630aaa803fe6af56501a8d6a67020daac8805a61b9e2dccefb5900b9

FROM ghcr.io/caprisys/kernel:$TALOS_KERNEL_VERSION as kernel

FROM scratch AS customization
COPY --from=kernel /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:$TALOS_VERSION
COPY --from=kernel /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
