Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcbce2b4
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 22:12:29 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6b0c890
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 22:12:29 +0000 (UTC)
Received: from [64.53.190.244] (port=53329 helo=[192.168.1.146])
 by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <joe@solidadmin.com>) id 1fV2SM-0005D2-VY
 for wireguard@lists.zx2c4.com; Mon, 18 Jun 2018 17:17:03 -0500
Subject: Re: wireguard-dkms issue after kernel upgrade
To: wireguard@lists.zx2c4.com
References: <CACwVs97ofUeBvEeV9sEGzA22f8cXm+TQY5Dm46uYHP4T3yjtGQ@mail.gmail.com>
 <914de940-9c1c-0fd1-13a6-f2f4e163063b@solidadmin.com>
 <CACwVs96h_D8dcE2ksaFC4=2ZJ2xK2-EvKPT7dxfuFTwvZQ5cCg@mail.gmail.com>
 <1ce94619-e124-b7b5-911d-abe1df4b5a46@solidadmin.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <743c9322-15a2-5afd-ca98-0ceec03e6156@solidadmin.com>
Date: Mon, 18 Jun 2018 17:17:02 -0500
MIME-Version: 1.0
In-Reply-To: <1ce94619-e124-b7b5-911d-abe1df4b5a46@solidadmin.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Anatolii,

You can also try

dnf downgrade dkms

which will downgrade to dkms to 
dkms-2.5.0-3.20180306gitb1b9033.fc28.noarch and see if you can reproduce 
the problem with this version. If so, doing the tests with DKMS 2.4 can 
be done with:

dnf install 
https://kojipkgs.fedoraproject.org//packages/dkms/2.4.0/1.20170926git959bd74.fc28/noarch/dkms-2.4.0-1.20170926git959bd74.fc28.noarch.rpm

Joe




-- 
Joe Doss
joe@solidadmin.com
