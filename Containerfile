FROM quay.io/fedora/fedora-coreos:testing-devel
# Run dnf to install software I need.
RUN dnf -y install \
    # Install dnf-plugins to use copr
    dnf5-plugins \
    # run local qemu vms
    libvirt-daemon-config-network libvirt-daemon-kvm qemu-kvm \
    virt-install virt-manager virt-viewer && \
    # Install podman-bootc thru copr
    dnf -y install 'dnf-command(copr)' && \
    dnf -y copr enable gmaglione/podman-bootc && \
    dnf -y install podman-bootc

