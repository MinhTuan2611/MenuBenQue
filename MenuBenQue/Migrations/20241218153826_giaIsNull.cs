using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MenuBenQue.Migrations
{
    public partial class giaIsNull : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "GiaMonKhuyenMai",
                table: "MonAns",
                type: "decimal(18,3)",
                precision: 18,
                scale: 3,
                nullable: true,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,2)");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<decimal>(
                name: "GiaMonKhuyenMai",
                table: "MonAns",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m,
                oldClrType: typeof(decimal),
                oldType: "decimal(18,3)",
                oldPrecision: 18,
                oldScale: 3,
                oldNullable: true);
        }
    }
}
