Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1983CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:57:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B936520890
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B936520890
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=elrepo.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc7025e9;
	Thu, 18 Jun 2020 19:36:53 +0000 (UTC)
Received: from quad.pendre.co.uk (quad.pendre.co.uk [92.27.241.245])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e2f7da4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 10:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by quad.pendre.co.uk (Postfix) with ESMTP id 7342F9600E2
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 12:02:27 +0100 (BST)
Received: from quad.pendre.co.uk ([127.0.0.1])
 by localhost (quad.pendre.co.uk [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ypIBvSgAmh4f; Thu, 18 Jun 2020 12:02:26 +0100 (BST)
Received: from quad.pendre.co.uk (quad.pendre.co.uk [192.168.0.1])
 by quad.pendre.co.uk (Postfix) with ESMTPSA id BB0E796008B
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 12:02:26 +0100 (BST)
Subject: Re: Kernel Panic after updating Kernel
To: wireguard@lists.zx2c4.com
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
From: Phil Perry <pperry@elrepo.org>
Message-ID: <05fe37e9-9f58-58cb-bf6c-1e886ea9317f@elrepo.org>
Date: Thu, 18 Jun 2020 12:02:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1592454690.22771558@webmail.emailsrvr.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 18 Jun 2020 21:36:45 +0200
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

On 18/06/2020 05:31, dxiri@xirihosting.com wrote:
> 
> 6) Yum operations trigger a lot of exclutions for elrepo, but nothing seems wireguard related:
> 

Not related to this bug, so for information only. The following is 
caused by a difference in the way CentOS compose their repositories over 
RHEL:

https://bugs.centos.org/view.php?id=15476

The solution is to enable the CentOS vault repo which will allow CentOS 
to more closely match RHEL behaviour and prevent the exclusions notified 
below. This is documented in /usr/share/doc/yum-plugin-elrepo-7.5.1/README


> Loaded plugins: changelog, elrepo, fastestmirror, priorities, tsflags, universal-hooks
> Loading mirror speeds from cached hostfile
>   * EA4: 208.100.0.204
>   * cpanel-addons-production-feed: 208.100.0.204
>   * cpanel-plugins: 208.100.0.204
>   * elrepo: elrepo.0m3n.net
>   * epel: mirror.csis.ysu.edu
> [elrepo]: excluding package: kmod-3c59x-0.0-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-8188eu-4.1.4_6773.20130222-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-8188eu-4.1.4_6773.20130222-5.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-8188eu-5.2.2.4-1.20190907git.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-a2818-1.20-1.el7.elrepo.x86_64
> [elrepo]: excluding package: kmod-a3818-1.6.0-1.el7.elrepo.x86_64
> [elrepo]: excluding package: kmod-a3818-1.6.2-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-aacraid-1.2.1-5.el7.elrepo.x86_64
> [elrepo]: excluding package: kmod-aic7xxx-7.0-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-ar5523-0.0-8.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-ar5523-0.0-9.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-ath5k-0.0-12.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-cassini-1.6-2.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-cciss-3.6.26-5.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-cciss-3.6.26-6.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-cciss-3.6.26-7.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-drbd84-8.4.11-1.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-drbd84-8.4.11-1.1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-drbd90-9.0.14-1.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-drbd90-9.0.16-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-drbd90-9.0.20-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-e100-3.5.24-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-ecryptfs-0.1-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-forcedeth-0.64-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-fpga-mgr-0.0-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-hfs-0.0-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-hfsplus-0.0-5.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-i2c-i801-0.0-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-i2c-i801-0.0-5.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-i2c-i801-0.0-6.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-ixgb-1.0.135-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-ixgbe-5.5.5-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-ixgbe-5.6.3-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-ixgbe-5.6.3-2.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-joydev-0.0-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-mt7601u-4.14.108-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-mt7601u-4.14.108-2.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-nct6775-0.0-4.20180327git.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-nct6775-0.0-5.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-ne2k-pci-1.03-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-netatop-0.3-4.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-netatop-2.0-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-niu-1.1-2.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-nvidia-440.44-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-libs-440.44-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-libs-440.44-1.el7_7.elrepo.i686
> [elrepo]: excluding package: nvidia-x11-drv-440.44-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-nvidia-440.59-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-libs-440.59-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-440.59-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-libs-440.59-1.el7_7.elrepo.i686
> [elrepo]: excluding package: kmod-nvidia-440.64-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-libs-440.64-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-libs-440.64-1.el7_7.elrepo.i686
> [elrepo]: excluding package: nvidia-x11-drv-440.64-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-nvidia-340xx-340.107-2.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-nvidia-340xx-340.107-3.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-nvidia-390xx-390.116-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-390xx-390.116-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-390xx-libs-390.116-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-390xx-libs-390.116-1.el7_6.elrepo.i686
> [elrepo]: excluding package: kmod-nvidia-390xx-390.116-2.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-390xx-libs-390.116-2.el7_7.elrepo.i686
> [elrepo]: excluding package: nvidia-x11-drv-390xx-390.116-2.el7_7.elrepo.x86_64
> [elrepo]: excluding package: nvidia-x11-drv-390xx-libs-390.116-2.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-r8168-8.046.00-1.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-r8168-8.047.04-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-r8168-8.047.05-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-r8168-8.048.00-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-r8169-6.020.00-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-r8822be-0.0-1.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-reiserfs-0.0-3.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-rr62x-1.2-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-rr64xl-1.4.0-1.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-rtl8812au-5.3.4-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-sis190-1.4-1.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-sis900-1.08.10-2.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-sym53c8xx-0.0-4.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-tpe-2.0.3-6.20170731git.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-tpe-2.0.4-1.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-typhoon-1.0-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-usbip-1.0.1-2.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-usbip-1.0.1-3.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-usbip-1.0.1-4.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-via-rhine-1.5.1-3.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-via-velocity-1.15-2.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-xpad-0.0.6-7.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-xpad-0.0.6-8.el7_6.elrepo.x86_64
> [elrepo]: excluding package: kmod-xpad-0.0.6-9.el7_7.elrepo.x86_64
> [elrepo]: excluding package: kmod-zd1211rw-1.0-6.el7_5.elrepo.x86_64
> [elrepo]: excluding package: kmod-zd1211rw-1.0-7.el7_7.elrepo.x86_64
> 178 packages excluded due to repository priority protections
> 

