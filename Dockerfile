ARG TALOS_VERSION=v1.1.1
ARG TALOS_KERNEL_VERSION=v1.1.0-17-g6e3133f

FROM ghcr.io/caprisys/kernel:$TALOS_KERNEL_VERSION as kernel

FROM scratch AS customization
COPY --from=kernel /lib/modules /lib/modules

FROM ghcr.io/siderolabs/installer:$TALOS_VERSION
COPY --from=kernel /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
