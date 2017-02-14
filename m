Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7d8eca3
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 21:39:20 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7983b3d
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 21:39:20 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: David Anderson <dave@natulte.net>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
In-Reply-To: <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
Date: Tue, 14 Feb 2017 10:50:14 -0500
Message-ID: <87o9y4n555.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon 2017-02-13 23:55:45 -0500, David Anderson wrote:
> "Once stretch is released" could be a few months still, right? It's only
> just gone into final freeze. I agree that once it's released, backports is
> definitely the right way to distribute.

Yep, it could still be a few months, depending on how rapidly we're able
to fix the remaining outstanding release-critical bugs.  

> So, I'd initially tried doing this, by adding the unstable repository at a
> negative priority. What turned me off is that even with that low
> preference, attempting to install the wireguard packages seemed to pull in
> some core system libraries (libc and such) from unstable as well. And while
> I'm excited about wireguard, I'm not "install unstable base libraries"
> excited :).

absolutely!  However, i'm a little surprised that this happened.  If you
could show a transcript of what you did specifically, and what the
resultant proposed apt changes were, i'd be interested in understanding
what went on there.

on a similar system i'm using (stretch, with unstable available but
pinned low), i see only packages from stretch being installed (aside
from wireguard itself, clearly)

0 root@test:~# cat /etc/apt/sources.list.d/unstable.list 
deb http://ftp.us.debian.org/debian/ unstable main
0 root@test:~# cat /etc/apt/preferences.d/limit-unstable 
Package: *
Pin: release a=unstable
Pin-Priority: 200
1 root@test:~# apt install wireguard-dkms wireguard-tools -d
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  binutils cpp cpp-6 dkms gcc gcc-6 libasan3 libatomic1 libcc1-0 libcilkrts5
  libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 libmpx2
  libquadmath0 libtsan0 libubsan0 make patch
Suggested packages:
  binutils-doc cpp-doc gcc-6-locales python3-apport menu gcc-multilib
  manpages-dev autoconf automake libtool flex bison gdb gcc-doc gcc-6-multilib
  gcc-6-doc libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan3-dbg
  liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libmpx2-dbg
  libquadmath0-dbg make-doc ed diffutils-doc
Recommended packages:
  fakeroot sudo linux-headers-686-pae | linux-headers-amd64
  | linux-headers-generic | linux-headers lsb-release libc6-dev | libc-dev
  libc6-dev
The following NEW packages will be installed:
  binutils cpp cpp-6 dkms gcc gcc-6 libasan3 libatomic1 libcc1-0 libcilkrts5
  libgcc-6-dev libgomp1 libisl15 libitm1 liblsan0 libmpc3 libmpfr4 libmpx2
  libquadmath0 libtsan0 libubsan0 make patch wireguard-dkms wireguard-tools
0 upgraded, 25 newly installed, 0 to remove and 0 not upgraded.
Need to get 22.4 MB of archives.
After this operation, 94.5 MB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://ftp.us.debian.org/debian stretch/main amd64 libmpfr4 amd64 3.1.5-1 [556 kB]
Get:2 http://ftp.us.debian.org/debian stretch/main amd64 libmpc3 amd64 1.0.3-1 [40.2 kB]
Get:3 http://ftp.us.debian.org/debian stretch/main amd64 binutils amd64 2.27.90.20170124-2 [3,761 kB]
Get:4 http://ftp.us.debian.org/debian stretch/main amd64 libisl15 amd64 0.18-1 [564 kB]
Get:5 http://ftp.us.debian.org/debian stretch/main amd64 cpp-6 amd64 6.3.0-6 [6,574 kB]
Get:6 http://ftp.us.debian.org/debian stretch/main amd64 cpp amd64 4:6.3.0-1 [18.6 kB]
Get:7 http://ftp.us.debian.org/debian stretch/main amd64 libcc1-0 amd64 6.3.0-6 [30.7 kB]
Get:8 http://ftp.us.debian.org/debian stretch/main amd64 libgomp1 amd64 6.3.0-6 [73.2 kB]
Get:9 http://ftp.us.debian.org/debian stretch/main amd64 libitm1 amd64 6.3.0-6 [27.3 kB]
Get:10 http://ftp.us.debian.org/debian stretch/main amd64 libatomic1 amd64 6.3.0-6 [8,904 B]
Get:11 http://ftp.us.debian.org/debian stretch/main amd64 libasan3 amd64 6.3.0-6 [311 kB]
Get:12 http://ftp.us.debian.org/debian stretch/main amd64 liblsan0 amd64 6.3.0-6 [115 kB]
Get:13 http://ftp.us.debian.org/debian stretch/main amd64 libtsan0 amd64 6.3.0-6 [256 kB]
Get:14 http://ftp.us.debian.org/debian stretch/main amd64 libubsan0 amd64 6.3.0-6 [107 kB]
Get:15 http://ftp.us.debian.org/debian stretch/main amd64 libcilkrts5 amd64 6.3.0-6 [40.6 kB]
Get:16 http://ftp.us.debian.org/debian stretch/main amd64 libmpx2 amd64 6.3.0-6 [11.2 kB]
Get:17 http://ftp.us.debian.org/debian stretch/main amd64 libquadmath0 amd64 6.3.0-6 [131 kB]
Get:18 http://ftp.us.debian.org/debian stretch/main amd64 libgcc-6-dev amd64 6.3.0-6 [2,296 kB]
Get:19 http://ftp.us.debian.org/debian stretch/main amd64 gcc-6 amd64 6.3.0-6 [6,852 kB]
Get:20 http://ftp.us.debian.org/debian stretch/main amd64 gcc amd64 4:6.3.0-1 [5,184 B]
Get:21 http://ftp.us.debian.org/debian stretch/main amd64 make amd64 4.1-9 [299 kB]
Get:22 http://ftp.us.debian.org/debian stretch/main amd64 patch amd64 2.7.5-1 [109 kB]
Get:23 http://ftp.us.debian.org/debian stretch/main amd64 dkms all 2.3-2 [74.8 kB]
Get:24 http://ftp.us.debian.org/debian unstable/main amd64 wireguard-dkms all 0.0.20170213-1 [90.2 kB]
Get:25 http://ftp.us.debian.org/debian unstable/main amd64 wireguard-tools amd64 0.0.20170213-1 [44.9 kB]
Fetched 22.4 MB in 2s (9,247 kB/s)     
Download complete and in download only mode
0 root@test:~# 

Please let me know what you're seeing that's different.

Regards,

       --dkg
