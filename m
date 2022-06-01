Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A65C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 09:36:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d6bf51f1;
	Wed, 1 Jun 2022 09:36:24 +0000 (UTC)
Received: from sym2.noone.org (sym.noone.org [2a01:4f8:120:4161::3])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c3edceb9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 09:36:23 +0000 (UTC)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4LCkYM4fZTzvjhV; Wed,  1 Jun 2022 11:36:23 +0200 (CEST)
Date: Wed, 1 Jun 2022 11:36:23 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH wireguard-go] tun: use ByteSliceToString from
 golang.org/x/sys/unix
Message-ID: <20220601093622.dacco7owtrm6u2y7@distanz.ch>
References: <20220601093354.30833-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601093354.30833-1-tklauser@distanz.ch>
User-Agent: NeoMutt/20170113 (1.7.2)
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

On 2022-06-01 at 11:33:54 +0200, Tobias Klauser <tklauser@distanz.ch> wrote:
> Use unix.ByteSliceToString in (*NativeTun).nameSloce to convert the
                                             ^- this should say
					     `nameSlow`

I can fix it up in a v2 patch if needed.
