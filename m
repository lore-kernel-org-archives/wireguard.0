Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF4BEF06E9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46509fae;
	Sun, 8 Feb 2026 17:17:17 +0000 (UTC)
Received: from kurisu.lahfa.xyz (kurisu.lahfa.xyz [163.172.69.160])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bd18f317
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Nov 2025 15:22:35 +0000 (UTC)
Date: Wed, 12 Nov 2025 16:22:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lahfa.xyz; s=kurisu;
 t=1762960955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=s1CC+YwjTX3Ne/1gC71656+qi2LHr36oGPNS5YzDluc=;
 b=XNnA1Xac3KoVxpEmywgRGY7EYvx+v8f63aLc05LQNisqbwDNaCVXT2PPmj53uwFYXALvkc
 BDg5JrExkvbvPAFT/8FEEhJ8eXW9g/1Oux8w13Xwt6hA6gBYt1+AF2UUSPA0rtHtZGTSIh
 iRmcwwuCUquoYWnr/FxXPY79f+xMh0c=
From: Ryan Lahfa <ryan@lahfa.xyz>
To: wireguard@lists.zx2c4.com
Subject: Mechanisms to offload/move the static ECDH calculations?
Message-ID: <mlnbxw7dbai4ylygtmh3b7rsyjsvxik3esgmyv3h5564tk577a@asilqkkntebk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:17:13 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thank you for WireGuard, it is an amazing tool.

These last months, I have been pondering how to integrate WireGuard with
the classical hardening of trapping the private key material in a device
and rendering it "unextractable" (modulo classical attacks on TPM2,
security keys, you name it.)

As I understand it, WireGuard exploits the private key to do an ECDH and
immediately continue the protocol without the static private key until a
reconnection.

I wonder if the *kernel* WireGuard implementation could offer means to
offload this specific ECDH calculation to userspace, what would be the
conditions or the reasons not to pursue such a thing. I am aware that
the userspace implementations can do that, but I find them less
interesting than the kernel implementation (proper forward secrecy,
formally verified cryptography usage, etc.).

If such a capability was offered via a Netlink message or anything,
userspace programs could prepare the ECDH result by calling into
userspace APIs to "secure devices", e.g. PKCS#11 for TPM2/security keys
or more specialized APIs. I considered the possibility to do PKCS#11
inside the kernel and I guess this is a non-starter due to the
complexity of this ecosystem and the danger it represents.

I realize that offloading the ECDH calculation to the userspace might be
dangerous and not constitute anymore what WireGuard(R) stands for, I am
interested to hear more about the vision around this.

Additionally, I understand that another way to go about this problem is
simply to forego the need to store the private key materiel in a secure
device by having it rotate regularly enough, which is the path that has
been taken by various software that works on the top of WireGuard and
provide some control plane distributing keys and so on. Unfortunately,
this requires *additional* infrastructure and this creates more SPOF
risks, in the context of building disaster recovery infrastructure, it
is often desireable to have break-the-glass private keys that can log in
even if the SSO/OIDC/control plane thing is down. It would be awesome if
that key could be stored in a "secure device" with the adequate policy
controls. Even more awesome: it would exist in native kernel WireGuard
and userspace could provide the hooks to make it this available out of
the box.

So this is really my question:

Is there any principled reason the in-kernel WireGuard implementation
must compute the static ECDH in-kernel?
  
If not, would the WireGuard developers accept an API that lets userspace
supply the precomputed ECDH outputs for the handshake
initiation/response?

If the answer is yes, I think the next questions will revolve around on
the design, what are the guarantees that must be uphold, consequences
about the ratelimit engine, etc.

Kind regards,
-- 
Ryan Lahfa
