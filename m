Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67f854b0
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 14:32:13 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 975587bc
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 14:32:13 +0000 (UTC)
Subject: Re: trouble installing on Fedora and CentOS
To: adam souzis <adam@souzis.com>
References: <CAJkVDg1O8SXWtR1cazOMQX6U-sxRVh57MNfTdNGBLpCUdOPnog@mail.gmail.com>
 <0774b643-23a3-5e57-c4db-889db42ae7eb@solidadmin.com>
 <CAJkVDg1-0rQU0KCoVTyyiEK2Usuyf=djszSJ2KhP6xJdZwgzow@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <7ba12438-298e-7cad-af65-c39ccb0de07f@solidadmin.com>
Date: Wed, 9 Aug 2017 09:54:06 -0500
MIME-Version: 1.0
In-Reply-To: <CAJkVDg1-0rQU0KCoVTyyiEK2Usuyf=djszSJ2KhP6xJdZwgzow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 08/09/2017 07:39 AM, adam souzis wrote:
> Hi Joe,
> 
> Thanks for looking into this, yes you are correct that my machine's 
> kernel version didn't match with what the rpm expected, I discovered 
> this when I tried to build from source. Maybe this error should be fatal 
> or output a message suggesting the expected kernel?

I am not sure how must effort that will require. If anyone has any ideas 
on how to make this edge case better I am all ears.

For the time being, just ensure you have the right kernel-headers 
installed for your running kernel and you should be fine.

> Have you tried to get your packages to working on an Atomic Host build? 
> When I did, the install failed:
> 
> [fedora@atomic~]$ uname -r
> 
> 4.11.11-300.fc26.x86_64
> 
> [fedora@atomic~]$ sudo rpm-ostree install 
> ./wireguard-dkms-0.0.20170726-1.fc26.noarch.rpm
> 
> Checking out tree 0715ce8... done
> 
> Resolving dependencies... done
> 
> Overlaying... done
> 
> *error: *Running %post for wireguard-dkms: Executing 
> bwrap(/usr/wireguard-dkms.post): Child process exited with code 8
> 
> So I just copied the wireguard.ko and wg binaries over from a regular 
> Fedora 26, did an insmod and things are working, so I'm good for now.


If I get some time I will ask the folks in #atomic what the best method 
is for adjusting a F26 RPM to work in Atomic. My hunch it is failing 
when it tries to write the WireGuard files to /usr/src/ which is read 
only (I think).

Joe




--
Joe Doss
joe@solidadmin.com
