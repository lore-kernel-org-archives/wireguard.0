Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4448be6
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 19:52:29 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 1ae10f19
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 19:52:29 +0000 (UTC)
Date: Tue, 8 Aug 2017 15:08:11 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: adam souzis <adam@souzis.com>
Subject: Re: trouble installing on Fedora and CentOS
Message-ID: <20170808200811.GB7930@wolff.to>
References: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Aug 08, 2017 at 12:58:58 -0700,
  adam souzis <adam@souzis.com> wrote:
>
>The bad news is I was unable to get Wireguard working on either CentOS 7,
>Fedora 26 or Fedora 25 (running these on AWS), it doesn't appear to be
>installing the kernel module properly.

I run it on rawhide (Fedora 27 effectivel) by building from source.

I have a local clone of the git repo and do the following:
cd WireGuard/src
make clean all
su
make install

That installs the kernel module in the running kernel. You'll need kernel-devel 
installed and maybe kernel-headers. If you are updating the module, you will 
want to stop wireguard and use rmmod wireguard to remove the existing module, 
so the new one will get loaded (or reboot the system).
