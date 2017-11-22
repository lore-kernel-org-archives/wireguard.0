Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6047dedd
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:46:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51b8edbd
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:46:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84951ff0
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:46:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cc4870c9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 23:46:25 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id b17so14988177oth.2
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 15:51:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAM3m09QZc=kJoXUQvCpCVQG62TeDX0B4BdcuUU3A9T2Lfg10VQ@mail.gmail.com>
References: <CAM3m09QZc=kJoXUQvCpCVQG62TeDX0B4BdcuUU3A9T2Lfg10VQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Nov 2017 00:51:35 +0100
Message-ID: <CAHmME9qBc1Wm1=QgAY6gSR65bsfNppsRjeZFwJfF1nBAr1WF9A@mail.gmail.com>
Subject: Re: Another allowed-ips question
To: Ryan Whelan <rcwhelan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Ryan,

Sorry for the delayed response. The high volume and churn of
development recently has gotten me a bit behind on the mail queue and
rather confused.

You wrote:
>  what i'm struggling with is if they are unable to communicate directly and build routes to one another via an intermediary router (which is also connected to each 'client' via wireguard).

If I understood you correctly, you're looking at this situation: Peer
A connects to Peer S. Peer B connects to Peer S. A wants to talk to B,
through S. In this case, the allowed-ips of S on A lists B's internal
IP, and the allowed-ips of S on B lists A's internal IP address. In
other words, you have A/B state that "I trust S to send me the traffic
of B/A."

Does this answer your question?

Regards,
Jason
