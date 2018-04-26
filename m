Return-Path: stunnel@attglobal.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2efe08cd
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 16:08:35 +0000 (UTC)
Received: from dnvrco-cmomta02.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c515244
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 16:08:35 +0000 (UTC)
Subject: Re: RX Errors from Android Peer
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <b110c9fb-fbd7-0e7a-31a7-bfec934ad058@attglobal.net>
 <CAHmME9ovmNCJ4501TDpvtu9doci1Z34jS9N88csgNskxq4QrRg@mail.gmail.com>
 <6e8c6b16-f131-6b45-9eee-f162a4f31099@attglobal.net>
 <CAHmME9oiL35cdLnxat5nXGmaT8U+HoLg+YzEGDuZw43-etReEQ@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
Message-ID: <4735eaed-f708-b154-dc7d-d3376f34338f@attglobal.net>
Date: Thu, 26 Apr 2018 09:09:00 -0700
MIME-Version: 1.0
In-Reply-To: <CAHmME9oiL35cdLnxat5nXGmaT8U+HoLg+YzEGDuZw43-etReEQ@mail.gmail.com>
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

Jason,

Gottcha.  Thank you for the explanation.

Cheers.


On 4/26/2018 6:04 AM, Jason A. Donenfeld wrote:
> Hello Eddie,
>
> Precisely what's happening here is that your device has various TCP
> connections that are open _before_ you turn on the VPN. Then you turn
> on the VPN, and now those prior TCP sessions try to continue over the
> VPN, using the old source IP address. It takes a few seconds for
> everything to time out, and for those TCP connections to be
> reestablished with the right new tunnel source IP. In the meantime,
> the WireGuard server gets packets using the old source IP, which of
> course isn't correlated with that peer's allowed IPs, and so it
> complains and rejects those packets. If it allowed them, that'd be a
> security problem.
>
> So, nothing to worry about.
>
> Jason
>
>
