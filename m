Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 973c8c67
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:22:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c07332e2
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:22:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab59c19b
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:22:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c417452
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 04:22:35 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w204so35607194oiw.0
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 20:32:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170109113544.GB4526@lud.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
 <20170108225732.GC9445@tuxmachine.polynome.dn42>
 <CAHmME9pSJ3gsAUdNhk_Lt-QzOf6+eS=cay_Chq8YpdcaZJbCsA@mail.gmail.com>
 <20170109113544.GB4526@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Jan 2017 05:32:15 +0100
Message-ID: <CAHmME9oKppSi9ROzrgaM_7etmZiEJdP=+YF2afSVNEjftvnHwA@mail.gmail.com>
Subject: Re: Varying source address and stateful firewalls (Was: Multiple
 Endpoints)
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

Thanks for the nice analysis. At first I was incredulous about the
results, but then I sat down and drew some pictures, and figured out
where the disconnect is. With hole punching, you have each peer
discovering the remote endpoint tuple, and sending an outgoing packet,
which then adjusts the stateful firewall. With em's example, there
isn't this luxury. So, I'll circle back the original thread, and
backtrack on my assertions in order to get back on track. Thanks for
investigating and showing where I erred.

Jason
