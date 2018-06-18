Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3303741f
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 21:59:55 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4df0c280
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 21:59:54 +0000 (UTC)
Subject: Re: wireguard-dkms issue after kernel upgrade
To: Anatolii Vorona <vorona.tolik@gmail.com>
References: <CACwVs97ofUeBvEeV9sEGzA22f8cXm+TQY5Dm46uYHP4T3yjtGQ@mail.gmail.com>
 <914de940-9c1c-0fd1-13a6-f2f4e163063b@solidadmin.com>
 <CACwVs96h_D8dcE2ksaFC4=2ZJ2xK2-EvKPT7dxfuFTwvZQ5cCg@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <1ce94619-e124-b7b5-911d-abe1df4b5a46@solidadmin.com>
Date: Mon, 18 Jun 2018 17:04:27 -0500
MIME-Version: 1.0
In-Reply-To: <CACwVs96h_D8dcE2ksaFC4=2ZJ2xK2-EvKPT7dxfuFTwvZQ5cCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: team@wireguard.com, WireGuard Mailing List <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 06/18/2018 02:06 PM, Anatolii Vorona wrote:
> Yes, i'm sure.
> I know what you speak about, and I have not any other 3rd-party dkms 
> (virtualbox, nvidia, etc.).
> Let me explain more about issue.
> 
> 1. We have kernel-4.16.10-300 and wireguard-dkms 0.0.20180524:
> There is a directory and symlink in /var/lib/dkms/wireguard/:
> 
>     drwxr-xr-x.   0.0.20180524
>     lrwxrwxrwx.  kernel-4.16.10-300.fc28.x86_64-x86_64 ->
>     0.0.20180524/4.16.10-300.fc28.x86_64/x86_64
> 
> 
> 2. After installing newest wireguard-dkms 0.0.20180613, we have two 
> dirs, and symlink to new dir (there is %post section):
> 
>     drwxr-xr-x.   0.0.20180524
>     drwxr-xr-x.   0.0.20180613
>     lrwxrwxrwx.  kernel-4.16.10-300.fc28.x86_64-x86_64 ->
>     0.0.20180613/4.16.10-300.fc28.x86_64/x86_64
> 
> 
> I'm not completely sure, but i think at this point we already have 
> broken dkms,
> because /var/lib/dkms/wireguard/0.0.20180524/source linked to the 
> deleted source /usr/src/wireguard-0.0.20180524.
> We can check it with `dkms status`, but there are not any old packages 
> in COPR repo.
> 
> 3. Install new kernel-4.16.15-300, and it will trigger the chain
> 
>     /etc/kernel/postinst.d/dkms -> /usr/lib/dkms/dkms_autoinstaller
>     -> dkms autoinstall --kernelver 4.16.15-300.fc28.x86_64
> 
> The last command will fail with error:
> 
>     Error! Could not locate dkms.conf file.
>     File: /var/lib/dkms/wireguard/0.0.20180524/source/dkms.conf does not
>     exist.
> 
> 4. Reboot to the new kernel.
> After reboot,  dkms.service will  start autoinstall command too: `dkms 
> autoinstall --verbose --kernelver $(uname -r)`
> with error:
> 
>     Jun 15 18:05:43 <deleted> systemd[1]: Stopped Builds and install new
>     kernel modules through DKMS.
>     -- Reboot --
> 
>     Jun 15 18:06:47 <deleted> systemd[1]: Starting Builds and install
>     new kernel modules through DKMS...
>     Jun 15 18:06:48 <deleted> sh[868]: Error! Could not locate dkms.conf
>     file.
>     Jun 15 18:06:48 <deleted> sh[868]: File:
>     /var/lib/dkms/wireguard/0.0.20180524/source/dkms.conf does not exist.
>     Jun 15 18:06:48 <deleted> systemd[1]: Started Builds and install new
>     kernel modules through DKMS.
> 
> 
> So, i think RPM have to remove /var/lib/dkms/wireguard/0.0.OLDVERSION 
> directory on upgrade.

I understand what you are saying here now. Thanks for taking the time to 
break this down for me.

I think it an edge case where a kernel update and a wireguard-dkms land 
in the same dnf update transaction. I just installed an older version of 
the wireguard-dkms RPM and then did a dnf upgrade to a newer version and 
it removed the old version just fine as part of the %postun section of 
the RPM spec.

## Start RPM Upgrade
$ dkms status
wireguard, 0.0.20180513, 4.17.0-200.fc28.x86_64, x86_64: installed

$ dkms status
wireguard, 0.0.20180513, 4.17.0-200.fc28.x86_64, x86_64: installed
wireguard, 0.0.20180524: added

$ dkms status
wireguard, 0.0.20180513, 4.17.0-200.fc28.x86_64, x86_64: installed
wireguard, 0.0.20180524, 4.17.0-200.fc28.x86_64, x86_64: built

$ dkms status
wireguard, 0.0.20180524, 4.17.0-200.fc28.x86_64, x86_64: installed
## Finish RPM Upgrade

You can see it adds the new version, builds it and removes it as the RPM 
upgrade happens. I don't think it is a problem with the RPM. I think it 
might be related to the updates to DKMS itself.

Seems like this change here might be impacting the issue maybe:

https://github.com/dell/dkms/issues/52

https://github.com/dell/dkms/commit/0c19129b5d1f8e03498f6f2455ad9f7e14e9e606#diff-aad3509f2a95a1bef3d5a4dcd105e1fd

Also this issue https://github.com/dell/dkms/issues/52 seems to be very 
close to what you are seeing.

I don't have the bandwidth on my end to track this down as I am slammed 
at work right now. If you can debug this more and open an issue on the 
DKMS GitHub with your findings that would be great.

Joe



-- 
Joe Doss
joe@solidadmin.com
