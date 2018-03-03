Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43e41d5a
 for <wireguard@lists.zx2c4.com>; Sat, 3 Mar 2018 04:22:21 +0000 (UTC)
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
 [209.85.223.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f804e29b
 for <wireguard@lists.zx2c4.com>; Sat, 3 Mar 2018 04:22:21 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id m22so12691493iob.12
 for <wireguard@lists.zx2c4.com>; Fri, 02 Mar 2018 20:31:18 -0800 (PST)
Return-Path: <reuben.m.work@gmail.com>
Received: from subterfuge.localnet ([2605:a601:93b:400:6e62:6dff:fe57:a551])
 by smtp.gmail.com with ESMTPSA id k76sm1581545ita.32.2018.03.02.20.31.16
 for <wireguard@lists.zx2c4.com>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 02 Mar 2018 20:31:16 -0800 (PST)
From: Reuben Martin <reuben.m.work@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Assigning addresses with avahi-autoipd
Date: Fri, 02 Mar 2018 22:04:56 -0600
Message-ID: <2324848.yjpPJzxhSp@subterfuge>
In-Reply-To: <CAHLp1YkeCV5KxT2npcSOVb_vyB5oWFY2vq4bA12QLFFeJytzvA@mail.gmail.com>
References: <CAHLp1YmDybu01qzrH4-=8U0Cm7__3myF4p75iejBB5Zd+AKs8g@mail.gmail.com>
 <CAHLp1YkeCV5KxT2npcSOVb_vyB5oWFY2vq4bA12QLFFeJytzvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Friday, March 2, 2018 8:41:34 AM CST Christophe-Marie Duquesne wrote:
> Hi,
> 
> The lack of answer suggested nobody was familiar enough with
> avahi-autoipd, so I am giving more details.

Nobody has answered because your questions are orthogonal to the scope of 
wireguard.

> So the first question would be: any chance wireguard can broadcast ARP
> request?

ARP is layer2. Wireguard is layer3. If you want ARP requests to propogate 
between the networks you will have to set up layer2 tunneling of some sort.

> So the second question is about whether wireguard supports
> broadcasting udp packets to 224.0.0.251 or the ipv6 equivalent
> ff02::fb 

If you want multicast traffic to propogate, an IGMP / MLP proxy server would 
probably be the easiest solution.

-Reuben
