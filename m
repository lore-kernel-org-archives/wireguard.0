Return-Path: <SRS0=D3OD=CF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DD2C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:28:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 388CF20738
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Aug 2020 08:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="TaCqPZqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 388CF20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=me.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de7cf762;
	Thu, 27 Aug 2020 08:00:26 +0000 (UTC)
Received: from st43p00im-zteg10073401.me.com (st43p00im-zteg10073401.me.com
 [17.58.63.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 865552f0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Aug 2020 22:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1598311526; bh=gORcQ5eR+p0+qNP4l53yvket3NwncOkPtSbaOdqaovo=;
 h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To;
 b=TaCqPZqmcZeOCJrJsbQTPORwkhX4WuRh0F1TpOvkPC2Fzp6Vk3V1y2vm7NAJsiRHd
 3z1XxKPWF/7LLBeX4SFXGBTtwzKbl/YJ2f4vgo4gpEwxEMcKlNWqKqowZV1irLLRYY
 3jaxqWWtB5kg8+QiODmv8l+JJbyIFmDpNIbADeDIkucNvYW5qNZJKpRMtGC/ckRvmT
 yftZyaOv42V8AaTprhRyCwvgmNTaIQUIBIPlpiExeTQlWbFBZUXqxOW/7j5mPgIjit
 CTzqEXHlgfjAGRKfsL4d0v904wLWdK0zFDoAQLgzOmOBQQWK7z2G7OeKh9Gl906o6J
 dWCv7kKB/ObIA==
Received: from localhost.localdomain (unknown [69.234.88.183])
 by st43p00im-zteg10073401.me.com (Postfix) with ESMTPSA id 87A635E02C6
 for <wireguard@lists.zx2c4.com>; Mon, 24 Aug 2020 23:25:26 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: kiyodandre@me.com
Mime-Version: 1.0 (1.0)
Date: Mon, 24 Aug 2020 18:25:25 -0500
Subject: Re: Tunneling protocol in WireGuard
Message-Id: <1A645382-4A36-4783-BDB5-6803491C6305@me.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPad Mail (18A5351d)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=468 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2004280000 definitions=main-2008240183
X-Mailman-Approved-At: Thu, 27 Aug 2020 10:00:21 +0200
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



Sent from my iPad
