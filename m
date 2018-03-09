Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57715d36
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 21:36:24 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcf34e15
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 21:36:24 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1euPpV-000BN0-Ps
 for wireguard@lists.zx2c4.com; Fri, 09 Mar 2018 22:45:34 +0100
Subject: Re: TCP Wireguard with socat
To: wireguard@lists.zx2c4.com
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
Date: Fri, 9 Mar 2018 22:45:32 +0100
MIME-Version: 1.0
In-Reply-To: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 09.03.2018 17:41, Gianluca Gabrielli wrote:
> My first thought has been to make use of socat

socat can do either packet streams or byte streams. A UDP socket (or a
tun/tap interface) is a packet stream. TCP is a byte stream. You can't
forward a packet stream into a byte stream. (Well, OK, socat does allow
you to set that up, but it won't work.)

You need wrap your packets in some sort of frame (simplest: precede each
with a length word (but think about byte ordering)). I'm sure there are
programs which do that, or you can write your own. socat can't do it.

-- 
-- Matthias Urlichs
