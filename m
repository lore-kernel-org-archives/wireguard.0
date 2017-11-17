Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c371b21
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 08:25:58 +0000 (UTC)
Received: from netz.smurf.noris.de (netz.smurf.noris.de [213.95.21.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 907d9f1f
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 08:25:58 +0000 (UTC)
Received: from [2001:780:107:a:225:22ff:feb1:a353]
 by netz.extern.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eFc1t-0005iu-U1
 for wireguard@lists.zx2c4.com; Fri, 17 Nov 2017 08:29:43 +0000
Subject: Re: Request: Optional "Comment" [Peer] entry
To: wireguard@lists.zx2c4.com
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
 <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
 <1510906834.6309.77.camel@gmx.de>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <bc1166f7-1a95-85ae-a528-700655f5ef1f@urlichs.de>
Date: Fri, 17 Nov 2017 09:29:40 +0100
MIME-Version: 1.0
In-Reply-To: <1510906834.6309.77.camel@gmx.de>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 17.11.2017 09:20, Manuel Schölling wrote:
> You could also use it for naming peers, i.e. using "Peer-(?P<name>[A-Za-z0-9\-]+)".

The usual way is to use a space as separator, i.e.

[Peer uplink]

This solves the naming issue. Nevertheless, a Comment= entry would also
be a good idea.

Also, after adding names we should use them as primary peer identifiers,
instead of their pubkeys.

-- 
-- Matthias Urlichs
