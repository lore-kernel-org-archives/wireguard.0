Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11743d84
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 14:49:22 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96133160
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 14:49:22 +0000 (UTC)
Received: from [108.160.195.141] (port=44566 helo=[192.168.0.49])
 by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 (envelope-from <joe@solidadmin.com>) id 1fIbGe-0003Ph-Nm
 for wireguard@lists.zx2c4.com; Tue, 15 May 2018 09:49:32 -0500
Subject: Re: Fedora/CentOS error: wireguard-dkms-1:0.0.20180420-1.fc28.noarch:
 erase failed
To: wireguard@lists.zx2c4.com
References: <f5c5a4c8-e20b-d810-909a-12ed0129b0a9@solidadmin.com>
 <1d73fc93-add5-eeff-b1c9-6cd7dbd6f9ab@gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <e87418d3-ac16-41cb-a425-e916661cf650@solidadmin.com>
Date: Tue, 15 May 2018 09:49:32 -0500
MIME-Version: 1.0
In-Reply-To: <1d73fc93-add5-eeff-b1c9-6cd7dbd6f9ab@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 05/15/2018 08:21 AM, Germano Massullo wrote:
> I had the same problem, and I followed your guide till
> 
>> # rpm -e wireguard-dkms-0.0.20180420-1.fc28.noarch
> 
> Then I wanted to use 0.0.20180513-1.fc28 snapshot, so I runned
> 
> # dkms autoinstall
> 
> but I got errors
> 
> Error! Could not locate dkms.conf file.
> File: /var/lib/dkms/wireguard/0.0.20180218/source/dkms.conf does not exist.

I never use dkms autoinstall but I just used it and I cannot reproduce 
the problem. It looks based on /var/lib/dkms/wireguard/0.0.20180218/ it 
is looking for a snapshot from Feb. It could be that you are having 
different problems here. Maybe your system had issues back in Feb where 
it thought it removed the RPM but didn't?

Since I don't see the 0.0.20180218 RPM installed you most likely can 
manually remove /var/lib/dkms/wireguard/0.0.20180218/ and this error 
should go away.

Joe



-- 
Joe Doss
joe@solidadmin.com
