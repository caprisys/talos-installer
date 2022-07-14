ARG TALOS_VERSION=v1.1.1
ARG TALOS_KERNEL_VERSION=v1.1.0-18-g0151db0@sha256:90b101e6a8a92b3aa39d9655781c1f1ecb2a57f6114de4b45942b6e910f5b2b2 

FROM ghcr.io/caprisys/kernel:$TALOS_KERNEL_VERSION as kernel

FROM scratch AS customization

FROM ghcr.io/siderolabs/installer:$TALOS_VERSION
COPY --from=kernel /boot/vmlinuz /usr/install/${TARGETARCH}/vmlinuz
COPY --from=kernel /lib/modules /lib/modules
