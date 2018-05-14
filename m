Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0ac8c5e
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 May 2018 14:50:12 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c49e47c3
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 May 2018 14:50:12 +0000 (UTC)
Received: from [64.53.190.244] (port=29209 helo=[192.168.1.146])
 by conquer.yellowcord.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
 (envelope-from <joe@solidadmin.com>) id 1fIEnq-0000BE-0K
 for wireguard@lists.zx2c4.com; Mon, 14 May 2018 09:50:18 -0500
Subject: Re: Procedure for Updating Snapshot
To: wireguard@lists.zx2c4.com
References: <22f3ea2f-b76e-e106-3e62-4584241e8d1a@attglobal.net>
 <CAHmME9q2p8-42t+ORM0MftDcjDvRi2TA0yBELO5gvXjQA08Mbw@mail.gmail.com>
 <27aed894-6521-7b2b-9148-d9d31f1dd62e@attglobal.net>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <b0c2fc11-7397-159a-7912-4bf0529aba37@solidadmin.com>
Date: Mon, 14 May 2018 09:50:17 -0500
MIME-Version: 1.0
In-Reply-To: <27aed894-6521-7b2b-9148-d9d31f1dd62e@attglobal.net>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Eddie,

On 05/14/2018 12:05 AM, Eddie wrote:
> Isn't that a little premature to drop support for CentOS 7.4.  7.5 was 
> only officially released 3 days ago.

Snapshot 0.0.20180420 still supports CentOS 7.4, so support hasn't been 
dropped. WireGuard is in active development and it would cause more pain 
than it is worth to have to figure out how to get the current snapshot 
working in both CentOS 7.4 and 7.5. A line has to be drawn somewhere to 
keep development efforts moving forward.

Even if WireGuard was in the mainstream kernel, if you didn't update to 
7.5 you would be running the older WireGuard code anyways. In my 
experience upgrading between point releases in CentOS is pretty safe, so 
I urge you do so if you feel you need the most recent WireGuard snapshot 
working.

Joe



-- 
Joe Doss
joe@solidadmin.com
