Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49791db8
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 02:50:17 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15d29567
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 02:50:16 +0000 (UTC)
Subject: Re: WG: Need for HW-clock independent timestamps
To: =?UTF-8?Q?Ivan_Lab=c3=a1th?= <labawi-wg@matrix-dream.net>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
 <20180521145618.GA3199@wolff.to>
 <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
 <20180522202537.GA18356@matrix-dream.net>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <b9bbce26-c6e4-77ec-595a-67fb8557e92d@urlichs.de>
Date: Wed, 23 May 2018 04:51:04 +0200
MIME-Version: 1.0
In-Reply-To: <20180522202537.GA18356@matrix-dream.net>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 22.05.2018 22:25, Ivan Labáth wrote:
> How about allowing counter wrapping, if it has been at least
> 2 * REKEY_TIMEOUT from last handshake? Perhaps reusing the cookie
> protocol for a 2-RTT handshake?
>
> Losing access to a device, because its clock has gone wonky is not pleasant.

If that happens, you can remove and re-add the peer.

-- 
-- Matthias Urlichs
