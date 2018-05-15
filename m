Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb19967d
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 15:01:18 +0000 (UTC)
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com
 [IPv6:2a00:1450:400c:c09::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5743ab64
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 15:01:18 +0000 (UTC)
Received: by mail-wm0-x22b.google.com with SMTP id a137-v6so16201797wme.1
 for <wireguard@lists.zx2c4.com>; Tue, 15 May 2018 08:01:31 -0700 (PDT)
Return-Path: <germano.massullo@gmail.com>
Received: from [192.168.1.100]
 (host75-210-dynamic.49-79-r.retail.telecomitalia.it. [79.49.210.75])
 by smtp.googlemail.com with ESMTPSA id
 j76-v6sm969751wmf.33.2018.05.15.08.01.29
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 May 2018 08:01:29 -0700 (PDT)
Subject: Re: Fedora/CentOS error: wireguard-dkms-1:0.0.20180420-1.fc28.noarch:
 erase failed
To: wireguard@lists.zx2c4.com
References: <f5c5a4c8-e20b-d810-909a-12ed0129b0a9@solidadmin.com>
 <1d73fc93-add5-eeff-b1c9-6cd7dbd6f9ab@gmail.com>
 <e87418d3-ac16-41cb-a425-e916661cf650@solidadmin.com>
From: Germano Massullo <germano.massullo@gmail.com>
Message-ID: <fd645d9c-0b4c-4282-cc62-84c0b79e77a7@gmail.com>
Date: Tue, 15 May 2018 17:01:28 +0200
MIME-Version: 1.0
In-Reply-To: <e87418d3-ac16-41cb-a425-e916661cf650@solidadmin.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 5/15/18 4:49 PM, Joe Doss wrote:
> On 05/15/2018 08:21 AM, Germano Massullo wrote:
>> I had the same problem, and I followed your guide till
>>
>>> # rpm -e wireguard-dkms-0.0.20180420-1.fc28.noarch
>>
>> Then I wanted to use 0.0.20180513-1.fc28 snapshot, so I runned
>>
>> # dkms autoinstall
>>
>> but I got errors
>>
>> Error! Could not locate dkms.conf file.
>> File: /var/lib/dkms/wireguard/0.0.20180218/source/dkms.conf does not
>> exist.
>
> I never use dkms autoinstall but I just used it and I cannot reproduce
> the problem. It looks based on /var/lib/dkms/wireguard/0.0.20180218/
> it is looking for a snapshot from Feb. It could be that you are having
> different problems here. Maybe your system had issues back in Feb
> where it thought it removed the RPM but didn't?
>
> Since I don't see the 0.0.20180218 RPM installed you most likely can
> manually remove /var/lib/dkms/wireguard/0.0.20180218/ and this error
> should go away.

It worked, thank you!
