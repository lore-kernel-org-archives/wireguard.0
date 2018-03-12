Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcbc0d93
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 11:21:08 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46fe2c8e
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 11:21:08 +0000 (UTC)
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1evLfI-0003At-Ol
 for wireguard@lists.zx2c4.com; Mon, 12 Mar 2018 12:30:52 +0100
Subject: Re: TCP Wireguard with socat
To: wireguard@lists.zx2c4.com
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
Date: Mon, 12 Mar 2018 12:30:51 +0100
MIME-Version: 1.0
In-Reply-To: <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 12.03.2018 10:15, Gianluca Gabrielli wrote:
> Do you mean that socat just forward packets through the two specified c=
hannel without wrapping them?

Exactly. it doesn't know how to do any wrapping+unwrapping, thus it's
useless for exchanging data between a stream-based and a packet-based
port/device/interface/whatever (assuming that you need to keep the
packet boundaries intact).

--=20
-- Matthias Urlichs
