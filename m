Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAA2C61DD3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Sep 2026 18:21:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0db6f665;
	Thu, 3 Sep 2026 18:21:44 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 88b3fd60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Sep 2026 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1788459694; x=1789064494; i=leeloored@gmx.com;
 bh=0oZNbfmjFEhyU2ssFZgNXeJXjkbobR79qeY9jboJ87g=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Message-Id:Mime-Version:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=npKTktBgWjXfIlVG/xIegEOPRQB3rLh5I2LwTzN2CAGsevsWYUe+g65QeY0ocfLk
 /zrSpKuRuvegY2H51tJypcnTlaVjil52xyiTz+pgcIBG3vpWdBws9o8iKCJL2lCCo
 fNsM51Q2e/tMQgyYZxX5pHWOqlYsnWkmTFhBTYXEZ8/1s1QbUCagG22unRqB8tsKO
 6YuWbpa66XkWCd5slFcP7wYepi8wFFd+923Z265y6jdDl0J+hiWvdbtiKwZTKKj1a
 iIYMCuFypp8l9LCBGHFEN/Q6Pvu7nO+3MwGrFpVJQ99gFovQYE5wxG9Rsu2Rh75sf
 9EXuF2LMGgyyVzW+ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mof9P-1wUiv90yS1-00psbS for
 <wireguard@lists.zx2c4.com>; Thu, 03 Sep 2026 20:21:34 +0200
Date: Thu, 3 Sep 2026 20:21:33 +0200
From: Kent Friis <leeloored@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Remove endpoint
Message-Id: <20260903202133.2383ecd75a9b94dec9dc3974@gmx.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ilYnAHNV+HuOGcjwil+4YpUmHSXf7qFcKSHa02MdIcWI9wW09fF
 hy1QWJnNURzZrHHKF6FPOzfR0jjkfZoO2v9cExiVfdAjH4741SOFwsTFoT5k8dYb6qzmpqt
 QR3Ve7jFXWnLgMjxXYT6ZcGF+8yYFeaktwokhb0EzlU9U3X9IhTIEk3WvWzQ2YKQSUO8KIg
 h40podrduSd2vsVh0Rlzw==
UI-OutboundReport: notjunk:1;M01:P0:QT6wejss7Lk=;PymwCP4eUXSHnhX11DIOs/RAzBm
 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
 GaSwSoc3cyD+efkOVcZ8g/V+3pzjBuXjHP1Is=
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

I can specify a peer with no endpoint in wg0.conf. It will then simply
not have an endpoint until it either receives a packet from the peer,
or one is specified with wg set ... endpoint ip:port.

Now, I'm on a mobile connection, so when I log off, I want to remove
the endpoint ip again so the "server" doesn't transmit stray packets
to a mobile ip address.

I tried

wg set wg0 peer XXX endpoint 0:0
wg set wg0 peer XXX endpoint off
wg set wg0 peer XXX endpoint none
wg set wg0 peer XXX endpoint ""

The first one sets the endpoint to 0.0.0.0 port 0, which is first of
all, usually treated as a broadcast address, and second, AFAIK there is
no port zero.

The other three give errors.

How to remove the endpoint while keeping the rest of the configuration?

/Kent
