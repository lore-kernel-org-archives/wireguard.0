Return-Path: mmoya@mmoya.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbcc67c0
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Dec 2016 13:11:56 +0000 (UTC)
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
 [209.85.210.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbaeee6d
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Dec 2016 13:11:56 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id j10so54519019wjb.3
 for <wireguard@lists.zx2c4.com>; Wed, 28 Dec 2016 05:20:00 -0800 (PST)
Return-Path: <mmoya@mmoya.org>
Received: from [192.168.177.2] (node03.mmoya.org. [45.76.39.94])
 by smtp.googlemail.com with ESMTPSA id x5sm64149736wje.36.2016.12.28.05.19.58
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Dec 2016 05:19:58 -0800 (PST)
Subject: Re: [WireGuard] Demo Server: Dual stack?
To: wireguard@lists.zx2c4.com
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
 <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
 <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
From: Maykel Moya <mmoya@mmoya.org>
Message-ID: <7973130b-159b-a7c9-c2d8-24ca7afa8914@mmoya.org>
Date: Wed, 28 Dec 2016 14:19:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 16/11/16 15:49, Jason A. Donenfeld wrote:

> On Wed, Nov 16, 2016 at 3:38 PM, Dan Lüdtke <mail@danrl.com> wrote:
>> Hi Jason,
>>
>>> I guess I could provide IPv6 connectivity, but.... why? It's a demo.
>>
>> Because it is a demo of a brand new protocol, showing how it can be used with legacy versions payload and transport protocol. I find that odd, but as I understand we have contradicting point of views on IP protocols.
> 
> I see what you mean. That's a fair point. We might as well give people
> an opportunity for trying things out, indeed.

Chiming in just to tell that my ip6 experience is a breeze since
wireguard appeared.

Right now I found myself advocating WG more as a simple-to-configure and
reliable-roaming ip6 tunnelling technology than a VPN itself.

I've previously used HE (with a handcrafted mechanism to update my
public ip4 endpoint whenever it changed) or SiXXs with a new daemon
running in my system.

With WG it's just setup and forget. Roaming is *reliable*, subjective
performance is impressive (you've done the measures, I just browse and
use services from the v6 internet without hassle).

IMHO ip6 tunnelling is a(nother) good selling point of WG.

Cheers,
maykel
