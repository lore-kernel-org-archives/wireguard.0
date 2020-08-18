Return-Path: <SRS0=FBn0=B4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3069C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 19:13:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63AE42076E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 19:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=outbound.mailhop.org header.i=@outbound.mailhop.org header.b="uEeeghwz";
	dkim=pass (2048-bit key) header.d=lakedaemon.net header.i=@lakedaemon.net header.b="1HgEd5nm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63AE42076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lakedaemon.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bedba81c;
	Tue, 18 Aug 2020 18:47:04 +0000 (UTC)
Received: from outbound2o.ore.mailhop.org (outbound2o.ore.mailhop.org
 [54.187.213.119])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80e8c27b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Aug 2020 11:30:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1597751787; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=BVSYF+ba5bEE5ykXpAb13FhynUmhJC7iRWlQX7/oDnaVjOVLmwLAMR2qLfgOW8OvhnFlv5X1gZM/4
 QP4tj3epD+eUfxDTZrVsge6skeWql2EUN94zzaGkOpiQVUTBpiHM4NiRcWfekYU+PMP+POvTea6Ntd
 Hhf3yt/IG0vYLGTyB1DWczb/j+NNpMBfuvQlo7UYB7Zk9EDPnzK+gNPVcITa+Tf9H0/yKijsBbwKl2
 p4HUknAfEzDSzGeDKCo3a6MCHsfTMlVExtu6hArk/8ABfbyTCHnRutsrTSk5WowQe2xWamXaljI79L
 RoxbnfFEP7nRjxWyzUbtpYVfaPa1APQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:dkim-signature:dkim-signature:from;
 bh=xt6pfIwe/HWrx1ZHEjKWJeIQn7RdWVuMVqKhhmvnRKw=;
 b=GSv9g9P3WqyuM4lDhvDBDVCw9I7cP9t6Iw74CI+oAqToY297HQNdQnS30eF7IQo7DHcOhERm3DLQq
 Ul2iz8/htvZVd+CjnJhGN73Vc2UQfH6vDCKjVLsnn1FAuBEoJtA/vNHIAqrKVXwwS9CR6YfngJOf9p
 vzs1ZWLHrU9X4stu5boTVcYhYpqgfRbaipL++ua0iXpbLkQM4KHaOi7gcp0EDNkhfNJtXvNWa9SH4j
 Qe1A7UP6ouvrSOnx5Prj4OJbGuKi7nKes+gwaF9wfemx52OMebsybZ+bCcCtDcr0ykuYJ6qDefc7NR
 XA9pkzB87P0CiPDgPzvGqFvtc6YZBMQ==
ARC-Authentication-Results: i=1; outbound4.ore.mailhop.org;
 spf=pass smtp.mailfrom=lakedaemon.net smtp.remote-ip=108.39.81.163;
 dkim=pass header.d=lakedaemon.net header.s=mail header.a=rsa-sha256
 header.b=1HgEd5nm; 
 dmarc=none header.from=lakedaemon.net;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=xt6pfIwe/HWrx1ZHEjKWJeIQn7RdWVuMVqKhhmvnRKw=;
 b=uEeeghwz0X92KYiwz3gJ+aG430dlIgR/6JAVoCQzaLWTdlnGaSWU0D2iXmm/kHKnZZ+0ld66e9DP+
 0A6OsLz/oTBQdW3QQW+WCV3Tat7tFQN8Plc/MVxHNau+C7JBwIwk7Zl7jT3VQjDk+led6c2Go3VIuM
 Yjo8LyZoi1OUgr9ReIQO8fey1oP9WPxDyBxqo1IpOd13+3RLWGPp8rePq7YLQglvMNi2F2673gIq7E
 B3TfWd4VtawKW0COr3O/DvWCHsDJx+poNsHbkejWHt3Tt56g7T+XmgbAI20xDKTYDPaX3lg1QlBowO
 qyCQETpx3UsfaS9eaSA7dLhF9ZPb4Sw==
X-MHO-RoutePath: amFjMjk5NzkyNDU4
X-MHO-User: d67a23f7-e149-11ea-b630-6b8aa7872eb8
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Originating-IP: 108.39.81.163
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from io (static-108-39-81-163.nrflva.fios.verizon.net
 [108.39.81.163]) by outbound4.ore.mailhop.org (Halon) with ESMTPSA
 id d67a23f7-e149-11ea-b630-6b8aa7872eb8;
 Tue, 18 Aug 2020 11:56:26 +0000 (UTC)
Received: from io.lakedaemon.net (localhost [127.0.0.1])
 by io (Postfix) with ESMTP id C3D5C80040;
 Tue, 18 Aug 2020 11:56:22 +0000 (UTC)
X-DKIM: OpenDKIM Filter v2.6.8 io C3D5C80040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lakedaemon.net;
 s=mail; t=1597751782;
 bh=xt6pfIwe/HWrx1ZHEjKWJeIQn7RdWVuMVqKhhmvnRKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=1HgEd5nmuvze6XbyX7UG0mJBPISP1Xb4G1i+vHXhVUdRkdcZFiJagR/XcGemzlEvY
 W6Bh/I9cA02DxmZ+1FOtO2xl90Wz7WaUnHMUfnOJCO5JG7LxP+pxXi0RdQYuKJoiew
 em9KF2zKptETegfkTf5uG5nlIK8BqKA6wBq/pW528XkrtIxlyd9CBZEMN8FyBCQk0w
 +ylPuErpL20549yw+q0eOi6KVFlOoQ9sYT9uLqlREbiSwCI6HWv1KqJ8XSxyBc4Qti
 bBmIIcbGcsguwh9cBnMen45qJ2B3dFElZtWAYMsCrmvTxuaNBCXy2AUETH6PLEkDpq
 GNbIIQseTJEuA==
Date: Tue, 18 Aug 2020 11:56:22 +0000
From: Jason Cooper <wireguard@lakedaemon.net>
To: Stephan Eichmeier <stephan@eichmeier.eu>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Bug in WireGuard ios14?
Message-ID: <20200818115622.GA14997@io.lakedaemon.net>
References: <04663CD6-2F41-4316-82A8-123FFC58FFE1@eichmeier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04663CD6-2F41-4316-82A8-123FFC58FFE1@eichmeier.eu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Tue, 18 Aug 2020 20:47:03 +0200
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

Hi Stephan,

On Sat, Aug 15, 2020 at 05:25:26AM +0000, Stephan Eichmeier wrote:
> if I use wireguard on iOS 14 there is a problem with “allowed IPs”.
> Routing all traffic with 0.0.0.0/0 works. 
> 
> But if I would like only to route 192.168.0.0/24 through WireGuard, it
> works also, but every connection except 192.168.0.0/24 doesn’t work.
> This happens only on iOS 14. 

Is that the hotspot subnet on iOS?  You might have a conflict there.

thx,

Jason
