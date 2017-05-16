Return-Path: pim@zandbergen.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff38f9fb
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 17:01:13 +0000 (UTC)
Received: from zandbergen.org (zandbergen.org [85.146.253.152])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1019f9e
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2017 17:01:13 +0000 (UTC)
Subject: Re: Wireguard on Centos 7
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <8a2eb5ef-f154-ecff-e080-57b9a63d1bce@inuits.eu>
 <0e838cd8-ae0c-eb86-5852-7a1190cae0dc@zandbergen.org>
 <CAHmME9qZB_YPhp2v34uWZJGAve8f4LbA2G_Kbx73ne48o3KGyA@mail.gmail.com>
From: Pim Zandbergen <pim@zandbergen.org>
Message-ID: <d2094c41-c535-40d1-6c50-dcbe95171df0@zandbergen.org>
Date: Tue, 16 May 2017 19:12:23 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9qZB_YPhp2v34uWZJGAve8f4LbA2G_Kbx73ne48o3KGyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

For RHEL/CentOS 7, I suppose would be something like this

# install elrepo repo
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo yum install 
http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

# install wireguard repo
sudo wget --timestamping --directory-prefix /etc/yum.repos.d 
https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/repo/epel-7/jdoss-wireguard-epel-7.repo

# install elrepo mainline kernel and wireguard
sudo yum --enablerepo=elrepo-kernel install kernel-ml kernel-devel 
wireguard-dkms wireguard-tools

You might leave out the elrepo stuff and leave that an exercise to the user.
There's an elrepo for RHEL/CentOS 5 and 6 as well, but I can't test that.

Pim


On 05/12/2017 05:31 PM, Jason A. Donenfeld wrote:
> Hey Pim,
>
> That sounds like a good idea to me. I'm not super qualified to write
> the optimal instructions. Think you could come up with a 2 or 3 line
> command blurb for the new RHEL/CentOS section?
>
> Jason
