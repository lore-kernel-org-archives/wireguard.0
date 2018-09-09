Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5aba4e3b
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 09:13:13 +0000 (UTC)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3609ee6
 for <wireguard@lists.zx2c4.com>; Sun, 9 Sep 2018 09:13:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 20-v6so18778812wrb.12
 for <wireguard@lists.zx2c4.com>; Sun, 09 Sep 2018 02:13:48 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Julian Orth <ju.orth@gmail.com>
Subject: Should setting the listen-port require CAP_SYS_ADMIN in the socket
 namespace?
Message-ID: <dd90475d-b9be-95a7-d23d-9d9c89cb4f2c@gmail.com>
Date: Sun, 9 Sep 2018 11:13:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello list,

Consider the following scenario:

1. Sysadmin runs a hostile application `h1` in container `c1`.
2. Sysadmin creates a Wireguard device `wg0` in the init namespace.
3. Sysadmin moves `wg0` into `c1`.
4. On the same server, a user wishes to sometimes run an application `a1` that
    listens on a well-known unprivileged port in the init namespace.

`h1` has a full set of capabilities in `c1`. This allows `h1` to listen on an
arbitrary unprivileged port in the init namespace by setting the listen-port
of `wg0`. This allows `h1` to block the usage of `a1`.

`h1` cannot gain access to the traffic of `a1` unless `a1` was also intending
to use this port for a Wireguard device `wg1` and the private key of `wg1` is
already known to `h1`.

Therefore: Should setting the listen-port require some capability in the
network namespace of the socket?

setns(<fd>, CLONE_NEWNET) requires CAP_SYS_ADMIN in the user namespace of <fd>
[1]. The leaves getting access to <fd>:

* If the namespace of <fd> is mounted somewhere in the file system, then `h1`
   might be able to open that file without any additional requirements. (If the
   namespace was created via ip(1), then it is mounted at /run/netns/<name>.)
* If /proc is mounted, opening /proc/<pid>/ns/net seems to require
   CAP_SYS_PTRACE in /proc/<pid>/ns/user.

I don't know if there are any other ways to get access to <fd> without help
from outside `c1`.

Running `c1` in a separate mount namespace with a separate / mount and a
separate pid namespace might be sufficient to prevent access to <fd>. This is
the case for Docker containers. Someone with a better overview of the
namespace model might be able to answer the following question: Are network
namespaces already considered insecure unless combined with mount and pid
namespaces? (A mount namespace is probably required to hide /sys/class/net.)

setns(<fd>, CLONE_NEWNET) is sufficient to create a socket in that network
namespace but also gives the caller other abilities in that namespace.
A less-powerful capability might therefore be better in the case of
listen-port.

Julian

PS: This problem becomes more severe with the transit-net series because it
     allows `h1` to create the socket in any network namespace it can refer to
     via process id or file descriptor. Note that the CAP_SYS_PTRACE
     requirement does not apply in this case because `h1` does not have to open
     /proc/<pid>/ns/net.

     This allows `h1` to gain network access by creating a Wireguard device and
     moving the transit namespace to PID 1.

     Once again, this might not a problem in containers with separate mount
     namespaces, separate / mounts, and separate pid namespaces.

     Since the selling point of the transit-net series is enabling users to
     create working Wireguard devices without capabilities, it series will have
     to be reworked as follows:

     The caller has to prove that he already had access to intended transit
     namespace. This can be done by passing matching UDP sockets into the
     kernel. Unfortunately this makes it harder to use this feature from Bash
     scripts alone.

     I'll add this requirement in v2.

[1] Not described in the man page. But see netns_install:
 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/core/net_namespace.c?h=v4.18#n1126
