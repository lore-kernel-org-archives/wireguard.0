Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3848ba85
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 May 2018 05:05:04 +0000 (UTC)
Received: from dnvrco-cmomta03.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7e74176
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 May 2018 05:05:04 +0000 (UTC)
Subject: Re: Procedure for Updating Snapshot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <22f3ea2f-b76e-e106-3e62-4584241e8d1a@attglobal.net>
 <CAHmME9q2p8-42t+ORM0MftDcjDvRi2TA0yBELO5gvXjQA08Mbw@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
Message-ID: <27aed894-6521-7b2b-9148-d9d31f1dd62e@attglobal.net>
Date: Sun, 13 May 2018 22:05:01 -0700
MIME-Version: 1.0
In-Reply-To: <CAHmME9q2p8-42t+ORM0MftDcjDvRi2TA0yBELO5gvXjQA08Mbw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Isn't that a little premature to drop support for CentOS 7.4.  7.5 was 
only officially released 3 days ago.

Cheers.


On 5/13/2018 2:29 PM, Jason A. Donenfeld wrote:
> We only support the most recent RHEL, which means 7.5, not 7.4. The
> last snapshot supporting 7.4 is 0.0.20180420. To use future snapshots,
> including 0.0.20180513, update to at least 7.5.
>
>
